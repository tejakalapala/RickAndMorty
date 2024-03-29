//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Teja on 21/06/23.
//

import Foundation

class RMCharacterCollectionViewCellViewModel{
public let characterName: String
private let characterStatus: RMCharacterStatus
private let characterImageUrl: URL?
    init(
        characterName:String,
        characterStatus: RMCharacterStatus,
        characterImageUrl:URL?
    ) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    public var characterStatusText:String{
        return characterStatus.rawValue
    }
    
    public func fetchImage(completion:@escaping (Result<Data,Error>)->Void){
        guard let url = characterImageUrl else{
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request,completionHandler: {data,_,error in
            guard let data = data,error == nil else{
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        })
        task.resume()
    }
    
}
