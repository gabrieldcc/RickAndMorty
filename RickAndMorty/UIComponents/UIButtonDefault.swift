//
//  UIButtonApp.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 29/01/23.
//

import UIKit

class UIButtonDefault: UIButton {
    
     init(title: String) {
         super.init(frame: .zero)
         initDefault(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(title: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .green
        self.layer.cornerRadius = 10
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    }
}
