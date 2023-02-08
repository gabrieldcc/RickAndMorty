//
//  UIButtonApp.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 29/01/23.
//

import UIKit

final class UIButtonDefault: UIButton {
    
    init(title: String,
         target: Any?,
         forEvent: UIControl.Event) {
        
        super.init(frame: .zero)
        initDefault(
            title: title,
            target: target,
            forEvent: forEvent
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(
        title: String,
        target: Any?,
        forEvent: UIControl.Event
    ) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .green
        self.layer.cornerRadius = 10
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    }
}
