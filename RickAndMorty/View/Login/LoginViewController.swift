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
        setupBindings()
        setupRegisterButton()
    }
    
    @objc func loginButtonTarget() {
        let login = containerView.loginTextField.text ?? ""
        let password = containerView.passwordTextField.text ?? ""
        let user = UserLogin(login: login, password: password)
        loginInteractor.validateUserLogin(loginInputed: user)
    }
    
    @objc func registerButtonTarget() {
        self.delegate?.signUp()
    }
    
    func setupBindings() {
        containerView.loginButton.addTarget(
            self,
            action: #selector(loginButtonTarget),
            for: .touchUpInside
        )
        loginInteractor.isUserValid = { [weak self] in
            self?.delegate?.successfullLogin()
        }
        loginInteractor.isNotValidUser = { [weak self] error in
            print(error)
        }
    }
    
    func setupRegisterButton() {
        containerView.registerButton.addTarget(
            self,
            action: #selector(registerButtonTarget),
            for: .touchUpInside)
    }
}
