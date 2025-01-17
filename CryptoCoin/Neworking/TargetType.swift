//
//  TargetType.swift
//  CryptoCoin
//
//  Created by 하연주 on 9/7/24.
//

import Foundation
import Alamofire

protocol TargetType: URLRequestConvertible {
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    
    var header: [String: String] { get }
    var parameters: String? { get }
    var queryItems: [URLQueryItem] { get }
    var body: Data? { get }
}


extension TargetType {
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        var request = try URLRequest(
            url: url.appendingPathComponent(path),
            method: method
        )
        request.allHTTPHeaderFields = header
        request.httpBody = body
        request.url?.append(queryItems: queryItems)
        return request
    }
    
}
