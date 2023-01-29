//
//  UILabelDefault.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 29/01/23.
//

import UIKit

class UILabelDefault: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        initDefault(text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initDefault(text: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = UIFont.boldSystemFont(ofSize: 16)
        self.textAlignment = .left
        self.textColor = .white
    }
}
