//
//  HomeViewRouter.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 27/12/22.
//

import Foundation
import UIKit

final class HomeRouter {
    //MARK: - Attributes
    var window: UIWindow?
    var homeViewController: HomeViewController?
    var navigationController: UINavigationController?
    
    //MARK: - Init
    init(window: UIWindow) {
        self.window = window
    }
    
    //MARK: - Funcs
    func showDetails(of character: Character) {
        let controller = DetailsViewController()
        controller.character = character
        navigationController?.pushViewController(
            controller,
            animated: true
        )
    }
    
    func setRootViewController() {
        homeViewController = HomeViewController()
        homeViewController?.delegate = self
        navigationController = UINavigationController(
            rootViewController: homeViewController ?? UIViewController()
        )
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
    
    //MARK: - HomeViewControllerDelegate
extension HomeRouter: HomeViewControllerDelegate {
    func show(character: Character) {
        showDetails(of: character)
    }
}


