//
//  MarketView(home).swift
//  CipherTick app
//
//  Created by Aryan Verma on 18/04/26.
//

import SwiftUI

struct MarketView: View {
    @Bindable var viewModel: MarketViewModel
    
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
                VStack(alignment: .leading, spacing: 1){
                    Text(viewModel.greeting)
                        .amountStyle(fontSize: FontT.amount)
                        .padding(.vertical)
                    CoinsOverView()
                    
                    TopCoinsView(sortedCoin: viewModel.sortedArray)
                        .padding([.horizontal, .top], 1)
                    
                    VStack {
                        ItemListView(filteredCoin: viewModel.sortedArray, selectedSort: $viewModel.selectedSort)
                    }
                    .card(color: GetColor.milkWhite, radius: CardT.RadiusOrPaddingT.smoothRadius)
                }
            }
            .background(GetColor.milkWhite)
            .refreshable {
                await viewModel.manualRefresh()
            }
        }
    }
}

#Preview {
    
    MarketView(viewModel: MarketViewModel(repository: CryptoRepositoryImpl()))
}
