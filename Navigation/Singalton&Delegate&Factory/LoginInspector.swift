

import Foundation

struct LoginInspector:LoginViewControllerDelegate {
    func validate (userName:String, password:String, complition: @escaping(Result<Bool, WordError>) -> Void) -> Bool {
        
        if userName == "Pop" && password == "123" {
            complition(.success(true))
        } else {
            complition(.failure(.wrongLoginPass))
        }
        
        return  false//Checker.shared.check(loginUser: userName, passwordUser: password)
    }
}
