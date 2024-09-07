//
//  CoinChartDetailViewModel.swift
//  CryptoCoin
//
//  Created by 하연주 on 9/7/24.
//

import Foundation
import Combine

final class CoinChartDetailViewModel : ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    @Published var marketData : CoinMarketResponse? = nil
    var marketHighlowPrice : [MarketPrice] = []
    var chartData : [ChartItem] = []
    
    func getMarketsData(id : String) {
        NetworkManager.shared.coinMatketDetail(ids: [id])
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self else { return }
                    switch value {
                    case .failure:
                        self.marketData = nil
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] value in
                    guard let self, let data = value.first else { return }
                    
                    
                    self.marketHighlowPrice = [
                        MarketPrice(category: "고가",color:.red , price: data.high24H),
                        MarketPrice(category: "저가",color:.blue , price: data.low24H),
                    ]
                    
                    self.chartData = data.sparklineIn7d.price.enumerated().map{ (offset, element) in
                        ChartItem(price: element, index: offset)
                    }
                    
                    self.marketData = data

                })
            .store(in: &cancellables)
    }
}
