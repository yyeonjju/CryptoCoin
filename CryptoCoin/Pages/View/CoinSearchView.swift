//
//  CoinSearchView.swift
//  CryptoCoin
//
//  Created by 하연주 on 9/6/24.
//

import SwiftUI

class CoinSearchViewModel : ObservableObject {
    @Published var searchKeyword : String = ""
    @Published var searchResults : [SearchCoin]?
    @Published var  likedItemIdList : [String] = []
}

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
                DispatchQueue.global().asyncAfter(deadline: .now()+1){
                    vm.searchResults = searchCoinMockResult
                }
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
                Text(item.name)
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
