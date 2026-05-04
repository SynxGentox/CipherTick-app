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
                VStack{
                    Color.clear
                        .card(color: GetColor.customGreen,
                              radius: CardT.RadiusOrPaddingT.smoothRadius)
                        .frame(height: CardT.HeightT.large)
                    
                    Color.clear
                        .card(color: GetColor.customGreen,
                              radius: CardT.RadiusOrPaddingT.smoothRadius)
                        .frame(height: CardT.HeightT.large)
                    
                    VStack {
                        ItemListView(filteredCoin: viewModel.filteredItems)
                    }
                    .background(GetColor.customGreen)
                    
                }
            }
            .background(GetColor.customBlack)
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
