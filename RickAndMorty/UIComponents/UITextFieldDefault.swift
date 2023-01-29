//
//  UITextFieldDefault.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 29/01/23.
//

import UIKit

class UITextFieldDefault: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        initDefault(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initDefault(placeholder: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont.boldSystemFont(ofSize: 16)
        self.textAlignment = .left
        self.textColor = .black
        self.placeholder = placeholder
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
    }
}
