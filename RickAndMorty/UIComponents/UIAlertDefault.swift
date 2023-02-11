//
//  UIAlertApp.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 11/02/23.
//

import UIKit

final class UIAlertDefault {
    
    static func showAlert(
        title: String,
        message: String,
        buttonTitle: String
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let button = UIAlertAction(
            title: buttonTitle,
            style: .default,
            handler: nil)
        
        alert.addAction(button)
    }
}
