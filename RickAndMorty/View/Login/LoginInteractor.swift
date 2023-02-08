//
//  LoginInteractor.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 04/02/23.
//

import Foundation

final class LoginInteractor {
    
    var logins: [UserLogin] = [
        UserLogin(login: "Gabrieldcc", password: "Gabriel98$"),
    ]
    var isUserValid: (() -> Void)?
    var isNotUserValid: ((String) -> Void)?
    
    func validateUserLogin(loginInputed: UserLogin) {
        let isLoginValid = logins.contains(
            where: { $0.login == loginInputed.login }
        )
        let isPasswordValid = logins.contains(
            where: { $0.password == loginInputed.password }
        )
        
        if  isLoginValid && isPasswordValid {
            self.isUserValid?()
        } else {
            //TODO: Implementar caso erro
            self.isNotUserValid?("Error")
        }
    }
}




    

