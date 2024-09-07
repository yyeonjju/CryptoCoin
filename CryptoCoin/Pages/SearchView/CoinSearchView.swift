//
//  CoinSearchView.swift
//  CryptoCoin
//
//  Created by 하연주 on 9/6/24.
//

import SwiftUI

struct CoinSearchView: View {
    @StateObject private var vm = CoinSearchViewModel()
    
    var body: some View {
        NavigationView {

            VStack{
                if vm.searchResults == nil {
                   Text("검색어를 입력해주세요")
                } else {
                    ScrollView {
                        searchResultView()
                    }
                }
            }
            .searchable(text: $vm.searchKeyword, prompt: "검색하세요")
            .autocorrectionDisabled(true)
            .onSubmit(of: .search) {
                vm.getSearchResult()
            }
            .navigationTitle("Search")
//            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}




extension CoinSearchView {
    func searchResultView() -> some View {
        LazyVStack {
            ForEach(vm.searchResults ?? [], id : \.self) { item in
                NavigationLink{
                    searchResultRowView(item: item)
                } label : {
                    searchResultRowView(item: item)
                }

            }
        }
    }
    
    func searchResultRowView(item : SearchCoin) -> some View {
        HStack {
            AsyncImage(url: URL(string: item.thumb))
                .frame(width: 40, height : 40 )
            
            VStack(alignment : .leading) {
//                Text(item.name)
                MultiColoredText(originalText: item.name, coloredSubstrings: [(vm.searchKeyword, .red)])
                    .font(.headline)
                Text(item.symbol)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }

            
            Spacer()
            
            Image(systemName: vm.likedItemIdList.contains(item.id) ? "star.fill" : "star")
                .foregroundStyle(.purple)
                .onTapGesture {
                    if let index = vm.likedItemIdList.firstIndex(where: {$0 == item.id}){
                        vm.likedItemIdList.remove(at: index)
                    } else{
                        vm.likedItemIdList.append(item.id)
                    }
                }
        }
        .padding(.horizontal)
        .padding(.vertical)
    }
}

#Preview {
    CoinSearchView()
}


struct MultiColoredText: View {
    var originalText: String
    var coloredSubstrings: [(String, Color)]
    
    var body: some View {
        var currentIndex = originalText.startIndex
        var result: Text = Text("")
        
        for (substring, color) in coloredSubstrings {
            if let range = originalText.range(of: substring, range: currentIndex ..< originalText.endIndex) {
                let beforeRange = originalText[currentIndex ..< range.lowerBound]
                let coloredText = originalText[range]
                
                result = result + Text(beforeRange)
                    .foregroundColor(.black)
                result = result + Text(coloredText)
                    .foregroundColor(color)
                
                currentIndex = range.upperBound
            }
        }
        
        let remainingText = originalText[currentIndex...]
        result = result + Text(remainingText)
            .foregroundColor(.black)
        
        return result
    }
}