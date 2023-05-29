//
//  RMGetCharactersResponse.swift
//  RickAndMorty
//
//  Created by Teja on 29/05/23.
//

import Foundation

struct RMGetAllCharactersResponse:Codable {
    struct Info:Codable {
        let count:Int?
        let pages:Int?
        let next:String?
        let prev:String?
        
    }
    let info:Info
    let results:[RMCharacter]
}


