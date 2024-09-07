//
//  NetworkManager.swift
//  CryptoCoin
//
//  Created by 하연주 on 9/7/24.
//

import Foundation
import Combine

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    private func fetch<T : Decodable> (model : T.Type, fetchRouter : Router) -> AnyPublisher<T, Error> {
        
        guard let request = try? fetchRouter.asURLRequest() else {
            return Fail(error: "Couldn't create request" as! Error).eraseToAnyPublisher()
        }
        print("request💚", request)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .print("💚")
//            .map{
//                if $0.response
//            }
            .map{$0.data}
            .decode(type: model.self, decoder: JSONDecoder())
            .print("💚💚")
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}

extension NetworkManager {
    func getSearchResult (keyword : String) -> AnyPublisher<SearchCoinResponse, Error> {
        let router = Router.searchCoin(query: keyword)
        return fetch(model: SearchCoinResponse.self, fetchRouter: router)
    }
}



