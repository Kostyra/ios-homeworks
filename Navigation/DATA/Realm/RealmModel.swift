

import Foundation
import RealmSwift

final class RealmModel:Object {
    @objc dynamic var id:String?
    @objc dynamic var username:String?
    @objc dynamic var password:String?
    
    override class func primaryKey() -> String? {
        "id"
    }
    
    convenience init(login: LoginModel) {
        self.init()
        self.id = login.id
        self.username = login.username
        self.password = login.password
    }
    
//     init(id: String? = nil, username: String? = nil, password: String? = nil) {
//        self.id = id
//        self.username = username
//        self.password = password
//    }
}
