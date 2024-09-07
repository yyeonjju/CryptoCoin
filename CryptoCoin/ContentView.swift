//
//  ContentView.swift
//  CryptoCoin
//
//  Created by 하연주 on 9/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        TabView {
            
            CoinChartDetailView(id: "bitcoin")
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Trend")
                }
            
            CoinSearchView()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Search")
                }
            
            Text("Favorite")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Favorite")
                }
            
        }
        .font(.headline)
        .tint(.purple)

    }
}

#Preview {
    ContentView()
}
