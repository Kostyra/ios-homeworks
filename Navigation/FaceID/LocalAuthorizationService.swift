

import LocalAuthentication

class  LocalAuthorizationService {
    
    //MARK: - Enum
    
        enum BiometricType {
            case none
            case touchID
            case faceID
            case unknown
        }
    
    
    //MARK: - Properties
    
    let context = LAContext()
    let policy: LAPolicy
    var error:NSError?
    var biometricType: String {
        let biometricType = context.biometryType
        switch biometricType {
        case .faceID:
            return "Face ID"
        case .touchID:
            return "Touth ID"
        default:
            return "Not Biometria"
        }
    }
   
    
    //MARK: - Life Cycle
    
    init(policy: LAPolicy, error: NSError? = nil) {
        self.policy = policy
        self.error = error
    }
    
    
     
    //MARK: - Method
    private func biometricType(for type: LABiometryType) -> BiometricType {
            switch type {
            case .none:
                return .none
            case .touchID:
                return .touchID
            case .faceID:
                return .faceID
            @unknown default:
                return .unknown
            }
        }
            
    func canEvaluate(completion: (Bool, BiometricType) -> Void) {
        guard context.canEvaluatePolicy(policy, error: &error) else { let type = biometricType(for: context.biometryType)
            guard error != nil else { return completion(false, type) }
            return completion(false, type) }
        completion(true, biometricType(for: context.biometryType))
    }
        
    func authorizeIfPossible(_ authorizationFinished: @escaping (Bool, Error?) -> Void) {
        if context.canEvaluatePolicy(policy, error: &error) {
            context.evaluatePolicy(policy, localizedReason: "Авторизация с помощью биометрии") { (success, authError) in
                DispatchQueue.main.async {
                    authorizationFinished(success, authError)
                }
            }
        } else if let authError = error as? LAError {
            switch authError.code {
            case .appCancel, .systemCancel:
                print( "Авторизация была отменена")
            case .biometryLockout:
                print("Слишком много неудачных попыток, пожалуйста, попробуйте позже")
            case .biometryNotAvailable:
                print("Биометрия недоступна на вашем устройстве")
            case .biometryNotEnrolled:
                print("Необходимо зарегистрировать биометрию в настройках устройства")
            case .userFallback:
                print("Пожалуйста, используйте альтернативный метод авторизации")
            default:
                print ("Ошибка при авторизации")
            }
        }

        else {
            authorizationFinished(false, error)
        }
    }
    
}
