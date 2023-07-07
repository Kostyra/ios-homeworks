//
//  CheckerService.swift
//  Navigation
//
//  Created by Юлия Филиппова on 05.07.2023.
//

import Foundation
import FirebaseAuth


protocol CheckerServiceProtocol {
    func checkCredentials(email: String, pass: String, completion: @escaping (Error?) -> ())
    func signUp(email: String, pass1: String , pass2: String)
}

final class CheckerService:CheckerServiceProtocol {
    func checkCredentials(email: String, pass: String, completion: @escaping (Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: pass) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                completion(error)
            } else {
                completion(nil)
            }
        }
    }
    
    func signUp(email: String, pass1: String, pass2: String) {
        if pass1 != pass2 { return }
        Auth.auth().createUser(withEmail: email, password: pass1) { authResult, error in
            if let error {
                print(error.localizedDescription)
            }
        }
    }
}


