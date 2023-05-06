

import Foundation
import UIKit

class User {
    var login:String
    var name:String
    var avatar:UIImage
    var status:String
    
    init(login: String, name: String, avatar: UIImage, status: String) {
        self.login = login
        self.name = name
        self.avatar = avatar
        self.status = status
    }
}


