

import Foundation


struct LoginModel {
    let id:String
    let username:String
    let password:String
    
    var keyValues:[String: Any] {
        [ "id": id,
          "username": username,
          "password": password
        ]
    }
    
    init(realmModel:RealmModel) {
        self.id = realmModel.id ?? ""
        self.username = realmModel.username ?? ""
        self.password = realmModel.password ?? ""
    }
    
    init(id: String, username: String, password: String) {
        self.id = id
        self.username = username
        self.password = password
    }
}
