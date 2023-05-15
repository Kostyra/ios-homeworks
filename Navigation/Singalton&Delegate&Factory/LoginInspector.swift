

import Foundation

struct LoginInspector:LoginViewControllerDelegate {
    func validate (userName:String, password:String) -> Bool {
        return Checker.shared.check(loginUser: userName, passwordUser: password)
    }
}
