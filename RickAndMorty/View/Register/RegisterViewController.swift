//
//  RegisterViewController.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 10/02/23.
//

import Foundation
import UIKit
import FirebaseAuth

protocol RegisterViewControllerDelegate: AnyObject {}


class RegisterViewController: UIViewController {
    //MARK: - Vars
    let containerView = RegisterView()
    weak var delegate: RegisterViewControllerDelegate?
    
    
    //MARK: - View lifecycle
    override func loadView() {
        super.loadView()
        self.view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupSignUpButton() {
        containerView.loginButton.addTarget(
            self,
            action: #selector(createUser),
            for: .touchUpInside
        )
    }
    
    @objc func createUser() {
        let email = containerView.loginTextField.text ?? ""
        let password = containerView.passwordTextField.text ?? ""
        
        Auth.auth().createUser(
            withEmail: email,
            password: password) {
                (authResult, error) in
                
                if let error = error {
                    print("DEBUG: Failed to create user with error:", error.localizedDescription)
                    return
                }
                print("Sign up was successful")
            }
        
    }
}
