//
//  SearchCoin.swift
//  CryptoCoin
//
//  Created by 하연주 on 9/6/24.
//

import Foundation


struct SearchCoinResponse : Decodable {
    let coins : [SearchCoin]
}

struct SearchCoin : Decodable, Hashable, Identifiable {
    let id : String
    let name : String
    let symbol : String
    let thumb : String
}


let searchCoinMockResult = [
    SearchCoin(id: "bitcoin", name: "Bitcoin", symbol: "BTC", thumb: "https://coin-images.coingecko.com/coins/images/1/thumb/bitcoin.png"),
    SearchCoin(id: "wrapped-bitcoin", name: "Wrapped Bitcoin", symbol: "WBTC", thumb: "https://coin-images.coingecko.com/coins/images/7598/thumb/wrapped_bitcoin_wbtc.png"),
    SearchCoin(id: "bitcoin-cash", name: "Bitcoin Cash", symbol: "BCH", thumb: "https://coin-images.coingecko.com/coins/images/780/thumb/bitcoin-cash-circle.png"),
    SearchCoin(id: "arbitrum", name: "Arbitrum", symbol: "ARB", thumb:  "https://coin-images.coingecko.com/coins/images/16547/thumb/arb.jpg"),
    SearchCoin(id: "bittensor", name: "Bittensor", symbol: "TAO", thumb: "https://coin-images.coingecko.com/coins/images/28452/thumb/ARUsPeNQ_400x400.jpeg"),
    SearchCoin(id: "whitebit", name: "WhiteBIT Coin", symbol: "WBT", thumb: "https://coin-images.coingecko.com/coins/images/27045/thumb/wbt_token.png"),
    SearchCoin(id: "bitcoin2", name: "Bitcoin", symbol: "BTC", thumb: "https://coin-images.coingecko.com/coins/images/1/thumb/bitcoin.png"),
    SearchCoin(id: "wrapped-bitcoin2", name: "Wrapped Bitcoin", symbol: "WBTC", thumb: "https://coin-images.coingecko.com/coins/images/7598/thumb/wrapped_bitcoin_wbtc.png"),
    SearchCoin(id: "bitcoin-cash2", name: "Bitcoin Cash", symbol: "BCH", thumb: "https://coin-images.coingecko.com/coins/images/780/thumb/bitcoin-cash-circle.png"),
    SearchCoin(id: "arbitrum2", name: "Arbitrum", symbol: "ARB", thumb:  "https://coin-images.coingecko.com/coins/images/16547/thumb/arb.jpg"),
    SearchCoin(id: "bittensor2", name: "Bittensor", symbol: "TAO", thumb: "https://coin-images.coingecko.com/coins/images/28452/thumb/ARUsPeNQ_400x400.jpeg"),
    SearchCoin(id: "whitebit2", name: "WhiteBIT Coin", symbol: "WBT", thumb: "https://coin-images.coingecko.com/coins/images/27045/thumb/wbt_token.png"),
    SearchCoin(id: "bitcoin3", name: "Bitcoin", symbol: "BTC", thumb: "https://coin-images.coingecko.com/coins/images/1/thumb/bitcoin.png"),
    SearchCoin(id: "wrapped-bitcoin3", name: "Wrapped Bitcoin", symbol: "WBTC", thumb: "https://coin-images.coingecko.com/coins/images/7598/thumb/wrapped_bitcoin_wbtc.png"),
    SearchCoin(id: "bitcoin-cash3", name: "Bitcoin Cash", symbol: "BCH", thumb: "https://coin-images.coingecko.com/coins/images/780/thumb/bitcoin-cash-circle.png"),
    SearchCoin(id: "arbitrum3", name: "Arbitrum", symbol: "ARB", thumb:  "https://coin-images.coingecko.com/coins/images/16547/thumb/arb.jpg"),
    SearchCoin(id: "bittensor3", name: "Bittensor", symbol: "TAO", thumb: "https://coin-images.coingecko.com/coins/images/28452/thumb/ARUsPeNQ_400x400.jpeg"),
    SearchCoin(id: "whitebit3", name: "WhiteBIT Coin", symbol: "WBT", thumb: "https://coin-images.coingecko.com/coins/images/27045/thumb/wbt_token.png"),
]
