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
    var interactor = LoginInteractor()
    
    //MARK: - Lifecycle View
    override func loadView() {
        self.view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginButton()
        setupRegisterButton()
    }
    
    //MARK: - Funcs
    @objc func loginButtonTarget() {
        let email = containerView.loginTextField.text ?? ""
        let password = containerView.passwordTextField.text ?? ""
        interactor.validateUserLogin(
            email: email,
            password: password
        )
    }
    
    @objc func registerButtonTarget() {
        self.delegate?.signUp()
    }
    
    private func setupLoginButton() {
        containerView.loginButton.addTarget(
            self,
            action: #selector(loginButtonTarget),
            for: .touchUpInside
        )
        loginSuccessHandler()
        loginFailHandler()
    }
    
    
    private func setupRegisterButton() {
        containerView.registerButton.addTarget(
            self,
            action: #selector(registerButtonTarget),
            for: .touchUpInside)
    }
    
    private func loginSuccessHandler() {
        interactor.isValidUser = { [weak self] in
            self?.delegate?.successfullLogin()
        }
    }
    
    private func loginFailHandler() {
        interactor.isNotValidUser = { [weak self] erro in
            print(erro)
            UIAlertDefault.showAlert(
                title: "Login ou senha incorretos",
                message: "Por favor, verifique seu usuário ou senha.",
                buttonTitle: "Ok",
                controller: self
            )
        }
    }
}
