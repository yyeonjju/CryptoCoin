//
//  APIURL.swift
//  CryptoCoin
//
//  Created by 하연주 on 9/7/24.
//

import Foundation

enum APIURL {
    static let baseURL = "https://api.coingecko.com/api/v3"
    
    static let searchCoin = "/search"
    static let coinMarketDetail = "/coins/markets"
/// ?vs_currency=krw
    /// &ids=bitcoin,wrapped-bitcoin,arbitrum
    /// &order=market_cap_desc
    /// &per_page=100
    /// &page=1
    /// &sparkline=false&locale=en"
}
