//
//  DetailsViewController.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 22/12/22.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    //MARK: - Var
    var character: Character?
    
    //MARK: - Let
    private let containerView = DetailsView()
    
    //MARK: -  View Lifecycle
    override func loadView() {
        self.view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let character = character else { return }
        containerView.nameDinamicLabel.text = character.name
        containerView.genderDinamicLabel.text = character.gender.rawValue
        containerView.updateLabels(character: character)
    }

    
}
