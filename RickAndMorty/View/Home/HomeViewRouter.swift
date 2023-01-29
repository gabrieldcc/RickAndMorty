//
//  HomeViewRouter.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 27/12/22.
//

import Foundation
import UIKit

class HomeViewRouter {
    
    var window: UIWindow?
    var homeViewController: HomeViewController?
    var navigationController: UINavigationController?
    
     init(window: UIWindow) {
        self.window = window
    }
    
     func showDetails(of character: Character) {
        let controller = DetailsViewController()
        controller.character = character
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func setRootViewController() {
        homeViewController = HomeViewController()
        homeViewController?.delegate = self
        navigationController = UINavigationController(rootViewController: homeViewController ?? UIViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

extension HomeViewRouter: HomeViewControllerDelegate {
    func show(character: Character) {
        showDetails(of: character)
    }
}


