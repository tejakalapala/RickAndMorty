//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Teja on 16/04/23.
//

import UIKit

class RMCharacterViewController: UIViewController {

    private let characterListView = CharacterListView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Characters"
        view.backgroundColor = .systemBackground
        setUpView()
        }
    
    private func setUpView(){
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
