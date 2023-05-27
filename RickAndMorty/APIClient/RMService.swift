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
    
    public func execute(_ request:RMRequest,completion:@escaping(Result<Any,Error>)->Void){
        
    }
}
