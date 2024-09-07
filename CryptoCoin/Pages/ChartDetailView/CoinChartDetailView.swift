//
//  CoinChartDetailView.swift
//  CryptoCoin
//
//  Created by 하연주 on 9/7/24.
//

import SwiftUI
import Charts

struct MarketPrice : Hashable {
    let category : String
    let color : Color
    let price : Int
}

struct ChartItem : Hashable, Identifiable {
    let id = UUID()
    let price : Double
    let index : Int
}

struct CoinChartDetailView: View {
    @StateObject private var vm = CoinChartDetailViewModel()
    
    let id : String
    
    var body: some View {

        VStack{
            if vm.marketData == nil {
                ProgressView()
                
            } else {
                let data = vm.marketData!
                
                VStack(alignment : .leading){
                    
                    marketNameSection(data : data)
                        .padding(.horizontal)
                    
                    
                    Text("₩ \(data.currentPrice)")
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding(.horizontal)
                    
                    Text("\(data.priceChangePercentage24H)")
                        .foregroundStyle( data.priceChangePercentage24H < 0 ? .blue : .red)
                        .padding(.horizontal)
                        .padding(.bottom, 30)
                    
                    
                    highLowPriceInfoSection()
                        .padding(.bottom,70)
                    
                    Chart(vm.chartData, id : \.id) { item in
                        AreaMark(
                            x: .value("Index", item.index),
                            y: .value("Price", item.price)
                        )
                        .foregroundStyle(
                            LinearGradient(gradient: Gradient(colors: [.purple, .white]), startPoint: .top, endPoint: .bottom)
                        )
                    }
                }

 
            }

        }

        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            vm.getMarketsData(id: id)
        }
        
    }
}

extension CoinChartDetailView {
    func marketNameSection(data : CoinMarketResponse) -> some View {
        HStack{
            AsyncImage(url: URL(string: data.image)){ image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width : 40, height : 40)
            } placeholder: {
                ProgressView()
            }

            
            Text(data.name)
                .font(.title)
                .fontWeight(.heavy)
            Spacer()
        }
    }
    
    func highLowPriceInfoSection () -> some View{
        LazyVGrid(
            columns: [GridItem(.fixed(UIScreen.main.bounds.width/2)), GridItem(.fixed(UIScreen.main.bounds.width/2))]
        ){
            ForEach(vm.marketHighlowPrice, id: \.self){ item in
                priceGridCard(item: item)
            }
        }
    }
    
    func priceGridCard(item : MarketPrice) -> some View {
        VStack(alignment : .leading){
            HStack{
                Text(item.category)
                    .foregroundStyle(item.color)
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
            }

            Text("₩ \(item.price)")
        }
        .frame(maxWidth: .infinity)
        .padding(.leading)
    }
}

#Preview {
    CoinChartDetailView(id: "bitcoin")
}
