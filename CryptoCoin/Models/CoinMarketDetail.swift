//
//  CoinMarketDetail.swift
//  CryptoCoin
//
//  Created by 하연주 on 9/7/24.
//

import Foundation

struct CoinMarketResponse: Decodable {
    let id, symbol, name: String
    let image: String
    let currentPrice, marketCap, marketCapRank, fullyDilutedValuation: Int
    let totalVolume, high24H, low24H: Int
    let priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double
    
//    let circulatingSupply, totalSupply, maxSupply, ath: Int
//    let athChangePercentage: Double
//    let athDate: String
//    let atl: Int
//    let atlChangePercentage: Double
//    let atlDate: String
//    let roi: JSONNull?
    let lastUpdated: String
    let sparklineIn7d : Sparkline

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        
//        case circulatingSupply = "circulating_supply"
//        case totalSupply = "total_supply"
//        case maxSupply = "max_supply"
//        case ath
//        case athChangePercentage = "ath_change_percentage"
//        case athDate = "ath_date"
//        case atl
//        case atlChangePercentage = "atl_change_percentage"
//        case atlDate = "atl_date"
//        case roi
        case lastUpdated = "last_updated"
        case sparklineIn7d = "sparkline_in_7d"
    }
}

struct Sparkline : Decodable {
    let price : [Double]
}
