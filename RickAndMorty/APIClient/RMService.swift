//
//  RMService.swift
//  RickAndMorty
//
//  Created by Teja on 16/04/23.
//

import Foundation

final class RMService{
    static let shared = RMService()
    private init(){}
    
    ///Send Rick and Morty API call
    ///-Parameters :
    ///-request : Request Instance
    ///-type: The type of object we expect to get back
    ///completion: callback with data or error
    public func execute<T:Codable>(
        _ request:RMRequest,
        expecting type:T.Type,
        completion:@escaping(Result<T,Error>)->Void){
        
    }
}
