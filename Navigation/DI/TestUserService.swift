

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
let myLogin = TestUserService(user: userInfo)
#else
let userInfo  = User(login: "123", name: "Max" , avatar: UIImage(named: "veidor")!, status: "active")
let myLogin = CurrentUserService(user: userInfo)
#endif
