

import Foundation


class Checker {
    static var shared = Checker()
    private let login:String = "Pop"
    private let password:String = "123"
    
    func check( loginUser:String , passwordUser:String) throws -> Bool {
        if loginUser == login && passwordUser == password {
            return true
        } else if loginUser != login && passwordUser != password {
            throw WordError.wrongLoginPass
        } else if loginUser != login && passwordUser == password {
            throw WordError.wrongLogin
        } else if  loginUser == login && passwordUser != password {
            throw WordError.wrongPass
        } else {
            throw WordError.other
        }
    }
    
    
}
