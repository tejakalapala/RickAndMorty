//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Teja on 20/06/23.
//

import Foundation
import UIKit

final class RMCharacterListViewViewModel:NSObject{
    func fetchCharacters(){
        RMService.shared.execute(.listCharacterRequests, expecting: RMGetAllCharactersResponse.self){
            result in
            switch result{
            case .success(let model):
                print("total:"+String(model.info.pages))
                print("page result count:"+String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
                }
        }
    }
}
extension RMCharacterListViewViewModel:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier, for: indexPath) as? RMCharacterCollectionViewCell else{
            fatalError("Unsupported cell")
        }
        let viewModel = RMCharacterCollectionViewCellViewModel(characterName: "Teja", characterStatus: .alive, characterImageUrl: nil)
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30) / 2
        return CGSize(
            width: width, height: width * 1.5
        )
    }
    
    
}
