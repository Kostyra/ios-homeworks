

import Foundation
import UIKit



class CurrentUserService: UserService {
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




