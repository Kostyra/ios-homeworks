

import Foundation

class Checker {
    static var shared = Checker()
    private let login:String = "Pop"
    private let password:String = "123"
    
    func check( loginUser:String , passwordUser:String) -> Bool {
        if loginUser == login && passwordUser == password {
            return true
        } else {
            return false
        }
    }
    
    
}
