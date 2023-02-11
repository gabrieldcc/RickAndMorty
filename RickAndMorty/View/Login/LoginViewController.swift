//
//  LoginViewController.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 26/01/23.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func successfullLogin()
    func signUp()
}

final class LoginViewController: UIViewController {
    
    //MARK: - Let
    let containerView = LoginView()
    weak var delegate: LoginViewControllerDelegate?
    var loginInteractor = LoginInteractor()
    
    //MARK: - Lifecycle View
    override func loadView() {
        self.view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginButton()
        setupRegisterButton()
    }
    
    @objc func loginButtonTarget() {
        let email = containerView.loginTextField.text ?? ""
        let password = containerView.passwordTextField.text ?? ""
        loginInteractor.validateUserLogin(
            email: email,
            password: password
        )
    }
    
    @objc func registerButtonTarget() {
        self.delegate?.signUp()
    }
    
    func setupLoginButton() {
        containerView.loginButton.addTarget(
            self,
            action: #selector(loginButtonTarget),
            for: .touchUpInside
        )
        loginInteractor.isValidUser = { [weak self] in
            self?.delegate?.successfullLogin()
        }
        loginInteractor.isNotValidUser = { [weak self] erro in
            UIAlertDefault.showAlert(title: <#T##String#>, message: <#T##String#>, buttonTitle: <#T##String#>)
        }
    }
    
    func setupRegisterButton() {
        containerView.registerButton.addTarget(
            self,
            action: #selector(registerButtonTarget),
            for: .touchUpInside)
    }
}
