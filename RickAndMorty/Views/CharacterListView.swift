//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Teja on 20/06/23.
//

import UIKit

final class CharacterListView: UIView {
    private let viewModel = CharacterListViewViewModel()
    private let spinner:UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.isHidden = true
        collectionView.alpha = 0
        return collectionView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubViews(spinner,collectionView)
        addConstrants()
        spinner.startAnimating()
        viewModel.fetchCharacters()
        setUpCollectionView()
    }
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstrants(){
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setUpCollectionView(){
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: { [self] in
            spinner.stopAnimating()
            collectionView.isHidden = false
            UIView.animate(withDuration: 0.4, animations: {
                self.collectionView.alpha = 1
            })
        })
    }
}
