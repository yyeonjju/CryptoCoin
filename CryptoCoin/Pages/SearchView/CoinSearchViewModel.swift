//
//  CoinSearchViewModel.swift
//  CryptoCoin
//
//  Created by 하연주 on 9/7/24.
//

import Foundation
import Combine


final class CoinSearchViewModel : ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    @Published var searchKeyword : String = ""
    @Published var searchResults : [SearchCoin]?
    @Published var  likedItemIdList : [String] = []
    
    
    func getSearchResult() {
        print("❤️search keyword -> ", searchKeyword)
//        DispatchQueue.global().asyncAfter(deadline: .now()+1){
//            self.searchResults = searchCoinMockResult
//        }
        
        NetworkManager.shared.getSearchResult(keyword: searchKeyword)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self else { return }
                    switch value {
                    case .failure:
                        self.searchResults = []
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] value in
                    guard let self else { return }
                    self.searchResults = value.coins

                })
            .store(in: &cancellables)
        
    }
}
