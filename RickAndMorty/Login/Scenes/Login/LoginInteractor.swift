//
//  LoginInteractor.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 04/02/23.
//

import Foundation
import FirebaseAuth

final class LoginInteractor {
    //MARK: - Attributes
    var logins: [UserLogin] = [
        UserLogin(login: "Gabrieldcc", password: "Gabriel98$"),
    ]
    var isValidUser: (() -> Void)?
    var isNotValidUser: ((Error) -> Void)?
    
    //MARK: - Funcs
    func validateUserLogin(email: String, password: String) {
        Auth.auth().signIn(
            withEmail: email,
            password: password) {
                (user, error) in
                if let error = error {
                    print("Unable to sign user in with error",
                          error.localizedDescription)
                    self.isNotValidUser?(error)
                } else {
                    self.isValidUser?()
                }
            }
    }
}
    
    
    
    
    
    
    
