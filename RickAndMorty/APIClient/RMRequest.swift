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
   private let pathComponents:[Set<String>]
   private let queryParameters:[URLQueryItem]
    ///Constructed url for API in string format
    private var urlString :String{
        var string = Constants.baseUrl + "/" + endpoint.rawValue
        if !pathComponents.isEmpty{
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        if !queryParameters.isEmpty{
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else{
                    return nil
                }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
        }
        return string
    }
    public var url:URL? {
        return URL(string: urlString)
    }
    public let httpMethod = "GET"
    init(endpoint: RMEndPoint,
         pathComponents: [Set<String>] = [],
         queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
