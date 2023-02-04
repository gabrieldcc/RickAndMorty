//
//  LoginView.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 26/01/23.

// imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
//imageView.transform = CGAffineTransform.identity

import Foundation
import UIKit

final class LoginView: UIView {
    
    //MARK: - Var
    var loginViewController: LoginViewController?
    
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .black
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Visual Components
    
    private lazy var rotateImageContainerView: UIView = {
        let element = UIView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .black
        
        return element
    }()
    
    private lazy var rotateImage: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 25
        element.layer.masksToBounds = true
        element.backgroundColor = .black
        element.image = UIImage(named: "portalRick")
    
        return element
    }()
    
    private lazy var backgroundVStack: UIStackView = {
        let element = UIStackView(frame: .zero)
        let green: CGColor = .init(red: 0, green: 255, blue: 0, alpha: 1)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.spacing = 10
        element.backgroundColor = .black
        element.layer.cornerRadius = 10
        element.layer.masksToBounds = true
        element.layer.borderColor =  green
        element.layer.borderWidth = 1
        
        return element
    }()
    
    private lazy var containerView: UIView = {
        let element = UIView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .black
        
        return element
    }()
    
    private lazy var containerVStack: UIStackView = {
        let element = UIStackView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .fill
        element.backgroundColor = .black
        element.layer.cornerRadius = 10
        
        return element
    }()
    
    private lazy var loginContainerVStack: UIStackView = {
        let element = UIStackView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .fill
        element.backgroundColor = .black
        element.layer.cornerRadius = 10
        
        return element
    }()
    
    private lazy var passwordContainerVStack: UIStackView = {
        let element = UIStackView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .fill
        element.distribution = .fill
        element.backgroundColor = .black
        element.layer.cornerRadius = 10
        
        return element
    }()
    
    private lazy var loginLabel: UILabelDefault = {
        let element = UILabelDefault(text: "Login")
        
        return element
    }()
    
    private lazy var loginTextField: UITextFieldDefault = {
        let element = UITextFieldDefault(placeholder: "  Digite seu login")
        
        return element
    }()
    
    private lazy var passwordLabel: UILabelDefault = {
        let element = UILabelDefault(text: "Senha")
        
        return element
    }()
    
    private lazy var passwordTextField: UITextField = {
        let element = UITextFieldDefault(placeholder: "  Digite sua senha")
    
        return element
    }()
    
    private lazy var loginButton: UIButtonDefault = {
        let element = UIButtonDefault(
            title: "Login",
            target: self,
            selector: #selector(targetLoginButton),
            forEvent: .touchUpInside
        )
        return element
    }()
    
    @objc func targetLoginButton() {
        LoginViewController().tapButton()
        print("button taped")
        let login = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let user = UserLogin(login: login, password: password)
    }
    
}

//MARK: - ViewCodable
extension LoginView: ViewCodableProtocol {
    func buildHierarchy() {
        addSubview(backgroundVStack)
        addSubview(rotateImageContainerView)
        addSubview(loginButton)
        containerView.addSubview(containerVStack)
        rotateImageContainerView.addSubview(rotateImage)
        
        ViewCodable.addArrangedSubviews(
            stackView: backgroundVStack,
            subviews: [containerView]
        )
        
        ViewCodable.addArrangedSubviews(
            stackView: containerVStack,
            subviews: [
                loginContainerVStack,
                passwordContainerVStack
            ]
        )
        
        ViewCodable.addArrangedSubviews(
            stackView: loginContainerVStack,
            subviews: [
                loginLabel,
                loginTextField,
            ]
        )
        
        ViewCodable.addArrangedSubviews(
            stackView: passwordContainerVStack,
            subviews: [
                passwordLabel,
                passwordTextField,
            ]
        )
    }
    
    func setupConstraints() {
        let defaultSize: CGFloat = 44
        let defaultSizeN: CGFloat = -44
        
        NSLayoutConstraint.activate([
            rotateImageContainerView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: defaultSize
            ),
            rotateImageContainerView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: defaultSize
            ),
            rotateImageContainerView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: defaultSizeN
            ),
            
            rotateImage.heightAnchor.constraint(equalToConstant: 280),
            rotateImage.widthAnchor.constraint(equalToConstant: 280),
            
            backgroundVStack.topAnchor.constraint(
                equalTo: rotateImage.bottomAnchor,
                constant: defaultSize
            ),
            backgroundVStack.centerXAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            backgroundVStack.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: defaultSize
            ),
            backgroundVStack.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: defaultSizeN
            ),
            
            
            containerView.topAnchor.constraint(
                equalTo: backgroundVStack.topAnchor
            ),
            containerView.bottomAnchor.constraint(
                equalTo: backgroundVStack.bottomAnchor
            ),
            containerView.leadingAnchor.constraint(
                equalTo: backgroundVStack.leadingAnchor
            ),
            containerView.trailingAnchor.constraint(
                equalTo: backgroundVStack.trailingAnchor
            ),
            
            containerVStack.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: 10
            ),
            containerVStack.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -10
            ),
            containerVStack.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: 10
            ),
            containerVStack.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -10
            ),
            
            loginLabel.heightAnchor.constraint(equalToConstant: defaultSize),
            loginTextField.heightAnchor.constraint(equalToConstant: defaultSize),
            passwordLabel.heightAnchor.constraint(equalToConstant: defaultSize),
            passwordTextField.heightAnchor.constraint(equalToConstant: defaultSize),
            
            loginButton.heightAnchor.constraint(equalToConstant: defaultSize),
            loginButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: defaultSize
            ),
            loginButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: defaultSizeN
            ),
            loginButton.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor,
                constant: defaultSizeN
            )
        ])
    }
}
