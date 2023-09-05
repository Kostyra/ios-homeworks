

import Foundation
import RealmSwift

protocol IRealmSevice {
    func isLoggedIn() -> Bool
    func saveCredentials(loginUser: LoginModel) -> Bool
//    func delete(loginUser: LoginModel) -> Bool
    func delete() -> Bool
}

final class RealmSevice: IRealmSevice {
    func isLoggedIn() -> Bool {
        do {
            let realm = try Realm()
            let object = !realm.objects(RealmModel.self).isEmpty
            return object
        } catch {
            return false
        }
    }
    
    func saveCredentials(loginUser: LoginModel) -> Bool {
        do {
            let realm = try Realm()
            try realm.write {
                realm.create(RealmModel.self,value: loginUser.keyValues)
            }
            return true
        } catch {
            return false
        }
    }
    
//    func delete(loginUser: LoginModel) -> Bool {
    func delete() -> Bool {
        do {
            let realm = try Realm()
//            let object = realm.objects(RealmModel.self).filter {
//                $0.id == loginUser.id }
            let object = realm.objects(RealmModel.self)
            
            try realm.write({
                realm.delete(object)
            })
            return true
        } catch {
            return false
        }
    }
    
    
}
