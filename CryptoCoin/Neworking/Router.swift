//
//  Router.swift
//  CryptoCoin
//
//  Created by 하연주 on 9/7/24.
//

import Foundation
import Alamofire


enum Router{
    case searchCoin(query : String)
}

extension Router : TargetType {
    var baseURL: String {
        return APIURL.baseURL
    }
    
    var path: String {
        switch self {
        case .searchCoin:
            return APIURL.searchCoin
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .searchCoin:
            return .get
        }
    }
    
    var parameters: String? {
        return nil
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .searchCoin(let query):
            return [
                URLQueryItem(name: "query", value: query)
            ]
        }
    }
    
    var body: Data? {
        return nil
    }
    
    var header: [String : String] {
        return [:]
    }
    
}
