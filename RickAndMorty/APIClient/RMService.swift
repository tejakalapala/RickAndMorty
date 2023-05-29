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
    
    enum RMServiceError:Error {
    case failedToCreateRequest
    case failedToGetData
    }
    
    ///Send Rick and Morty API call
    ///-Parameters :
    ///-request : Request Instance
    ///-type: The type of object we expect to get back
    ///completion: callback with data or error
    public func execute<T:Codable>(
        _ request:RMRequest,
        expecting type:T.Type,
        completion:@escaping(Result<T,Error>)->Void){
            guard let urlRequest = self.request(from: request) else{
                completion(.failure(RMServiceError.failedToCreateRequest))
                return
            }
            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard let data = data, error == nil else{
                    completion(.failure(error ?? RMServiceError.failedToGetData))
                    return
                }
                do{
                    let result = try JSONDecoder().decode(type.self, from: data)
                    print(String(describing: result))
                    completion(.success(result))
                }catch{
                    completion(.failure(error))
                }
            }
            task.resume()
            
    }
    
    private func request(from rmRequest:RMRequest)-> URLRequest?{
        guard let url = rmRequest.url else {return nil}
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
