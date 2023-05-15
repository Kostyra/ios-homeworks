

import Foundation


import Foundation
import UIKit



class TestUserService: UserService {
    private var user:User?
    init(user:User) {
        self.user = user
    }
    func pass(login: String) -> User? {
        if let user = user, user.login == login {
            return user
        } else {
            return nil
        }
    }
}

#if DEBUG
let userInfo  = User(login: "123", name: "Den" , avatar: UIImage(named: "doctor")!, status: "active")
#else
let userInfo  = User(login: "123", name: "Max" , avatar: UIImage(named: "veidor")!, status: "active")
#endif
