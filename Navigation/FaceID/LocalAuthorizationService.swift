

import LocalAuthentication

class  LocalAuthorizationService {
    
    
    //MARK: - Properties
    
    let context = LAContext()
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
    
    
    //MARK: - Method
        
    func authorizeIfPossible(_ authorizationFinished: @escaping (Bool, Error?) -> Void) {
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Авторизация с помощью биометрии") { (success, authError) in
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
