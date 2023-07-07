

import Foundation


protocol LoginViewControllerDelegate {
    func check (userName:String, password:String) -> Bool
}


extension LoginViewControllerDelegate {
    func check (userName:String, password:String) -> Bool {
        let checker = Checker()
        do {
            return try checker.check(loginUser: userName, passwordUser: password)
        } catch WordError.wrongLoginPass{
            print("Wrong Login Pass")
            return false
        } catch WordError.wrongLogin {
            print("Wrong Login")
            return false
            
        } catch WordError.wrongPass{
            print("Wrong Pass")
            return false
            
        } catch {
            return false
        }
        
    }
}
