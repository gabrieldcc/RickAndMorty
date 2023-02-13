//
//  LoginInteractor.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 04/02/23.
//

import Foundation
import FirebaseAuth

final class LoginInteractor {
    
    var logins: [UserLogin] = [
        UserLogin(login: "Gabrieldcc", password: "Gabriel98$"),
    ]
    var isValidUser: (() -> Void)?
    var isNotValidUser: ((Error) -> Void)?
    
    func validateUserLogin(email: String, password: String) {
        //        let isLoginValid = logins.contains(
        //            where: { $0.login == loginInputed.login }
        //        )
        //        let isPasswordValid = logins.contains(
        //            where: { $0.password == loginInputed.password }
        //        )
        //
        //        if  isLoginValid && isPasswordValid {
        //            self.isUserValid?()
        //        } else {
        //            //TODO: Implementar caso erro
        //            self.isNotValidUser?("Error")
        //        }
        
        Auth.auth().signIn(
            withEmail: email,
            password: password) {
                (user, error) in
                
                if let error = error {
                    print("Unable to sign user in with error", error.localizedDescription)
                    self.isNotValidUser?(error)
                } else {
                    self.isValidUser?()
                }
            }
    }
}
    
    
    
    
    
    
    
