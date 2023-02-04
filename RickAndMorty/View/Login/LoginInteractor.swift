//
//  LoginInteractor.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 04/02/23.
//

import Foundation

class LoginInteractor {
    
    var logins: [UserLogin] = []
    
    
    func validateUserLogin(loginInputed: UserLogin) -> Bool {
        var isUserValid = false
        let isLoginValid = logins.contains(where: { $0.login == loginInputed.login })
        let isPasswordValid = logins.contains(where: { $0.password == loginInputed.password })
        
        if  isLoginValid {
            isUserValid = true
        } else if isPasswordValid {
            isUserValid = true
        }
        return isUserValid
    }
}



    
    

