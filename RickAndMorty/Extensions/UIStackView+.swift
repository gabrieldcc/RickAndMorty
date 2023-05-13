//
//  StackView+.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 13/05/23.
//

import Foundation
import UIKit

extension UIStackView {
    func addArrangedSubviews(_ subviews: [UIView]) {
        for view in subviews {
            self.addArrangedSubview(view)
        }
    }
}
