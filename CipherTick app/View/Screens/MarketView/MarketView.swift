//
//  MarketView(home).swift
//  CipherTick app
//
//  Created by Aryan Verma on 18/04/26.
//

import SwiftUI

struct MarketView: View {
    @State private var viewModel = MarketViewModel(repository: CryptoRepositoryImpl())
    
    var body: some View {
        NetworkStateController(state: viewModel.appState,
                               onRetry: viewModel.fetch,
                               success: { content })
        .task { await viewModel.fetch() }
            
    }
    
    @ViewBuilder
    var content: some View {
        FeatureEnabler(flag: APIConfig.shared.isEnabledCoin) {
            ScrollView {
                VStack(spacing: 0){
                    CoinsOverView()
                    
                    TopCoinsView(sortedCoin: viewModel.sortedArray)
                        .padding([.horizontal, .top], 1)
                    
                    VStack {
                        ItemListView(filteredCoin: viewModel.filteredItems)
                    }
                    .card(color: GetColor.ghostWhite, radius: CardT.RadiusOrPaddingT.smoothRadius)
                }
            }
            .background(GetColor.ghostWhite)
            .searchable(text: $viewModel.searchText, prompt: "Search coins, symbols...")
            .refreshable {
                await viewModel.manualRefresh()
            }
        }
    }
}

#Preview {
    
    MarketView()
}
