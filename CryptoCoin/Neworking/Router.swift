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
    case coinMarketDetail(ids : [String])
}

extension Router : TargetType {
    var baseURL: String {
        return APIURL.baseURL
    }
    
    var path: String {
        switch self {
        case .searchCoin:
            return APIURL.searchCoin
        case .coinMarketDetail :
            return APIURL.coinMarketDetail
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .searchCoin, .coinMarketDetail:
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
        case .coinMarketDetail(let ids):
            print("❤️ids❤️", ids.joined(separator: ","))
            return [
                URLQueryItem(name: "ids", value: ids.joined(separator: ",")),
                URLQueryItem(name: "sparkline", value: "true"),
                
                URLQueryItem(name: "vs_currency", value: "krw"),
                URLQueryItem(name: "order", value: "market_cap_desc"),
                URLQueryItem(name: "per_page", value: "100"),
                URLQueryItem(name: "page", value: "1"),
                URLQueryItem(name: "locale", value: "en"),
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
