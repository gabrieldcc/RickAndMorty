//
//  HomeViewRouter.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 27/12/22.
//

// Como fazer essa comunicacao entre o Router e a VC usando protocolo, ao inves de class func?

import Foundation
import UIKit

class HomeViewRouter: HomeViewControllerProtocol {
        
     func show(from: UIViewController, character: Character) {
        let controller = DetailsViewController()
        controller.character = character
        from.navigationController?.pushViewController(controller, animated: true)
    }
    
    func teste() {
        
    }
}


