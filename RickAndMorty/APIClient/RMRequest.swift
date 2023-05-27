//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Teja on 16/04/23.
//

import Foundation

final class RMRequest{
    
    private struct Constants{
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
   private let endpoint:RMEndPoint
   private let pathComponents:[String]
   private let queryParameters:[URLQueryItem]
    private var urlString :String{
        var string = Constants.baseUrl + "/" + endpoint.rawValue
        if !pathComponents.isEmpty{
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        if !queryParameters.isEmpty{
            queryParameters.forEach({
                string += "/\($0)"
            })
        }
        return string
    }
    public var url:URL? {
        return nil
    }
    init(endpoint: RMEndPoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
