//
//  ViewCodable.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 22/12/22.
//

import Foundation
import UIKit

public protocol ViewCodableProtocol {
    func buildHierarchy()
    func setupConstraints()
    func applyAdditionalChanges()
}

public extension ViewCodableProtocol {
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }

    func applyAdditionalChanges() {}
}

class ViewCodable {
    class func addArrangedSubviews(stackView: UIStackView, subviews: [UIView]) {
        for view in subviews {
            stackView.addArrangedSubview(view)
        }
    }
}
