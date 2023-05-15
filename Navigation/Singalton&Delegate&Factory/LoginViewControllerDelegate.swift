

import Foundation


protocol LoginViewControllerDelegate {
    func check (userName:String, password:String) -> Bool
}


extension LoginViewControllerDelegate {
    func check (userName:String, password:String) -> Bool {
        let checker = Checker()
        return checker.check(loginUser: userName, passwordUser: password)
    }
}
