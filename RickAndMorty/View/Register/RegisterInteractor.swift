//
//  RegisterInteractor.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 11/02/23.
//

import FirebaseAuth

final class RegisterInteractor {
    
    var isNotUserValid: (()-> Void)?
    var isUserValid: (()-> Void)?
    
    func createUser(email: String, password: String) {
        Auth.auth().createUser(
            withEmail: email,
            password: password) {
                (authResult, error) in
                if let error = error {
                    self.isNotUserValid?()
                    print("DEBUG: Failed to create user with error: ", error.localizedDescription)
                } else {
                    self.isUserValid?()
                }
            }
    }
}
