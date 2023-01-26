//
//  ViewCodable.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 22/12/22.
//

import Foundation

public protocol ViewCodable {
    func buildHierarchy()
    func setupConstraints()
    func applyAdditionalChanges()
}

public extension ViewCodable {
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }

    func applyAdditionalChanges() {}
}
