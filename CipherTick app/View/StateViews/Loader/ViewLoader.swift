//
//  ViewLoader.swift
//  CipherTick app
//
//  Created by Aryan Verma on 15/04/26.
//

import SwiftUI

struct ViewLoader: View {
    @State private var viewModel = MarketViewModel(repository: CryptoRepositoryImpl())
    var body: some View {
        TabView {
            Tab("", systemImage: "coloncurrencysign.circle.fill") {
                NavigationStack {
                    MarketView(viewModel: viewModel)
                        .navigationDestination(for: AppRoute.self) { route in
                            switch route {
                            case .coinDetail(let coin):
                                CoinDetailsView(coin: coin)  // placeholder
                            }
                        }
                }
            }
            Tab("", systemImage: "square.fill.on.circle.fill") {}
            Tab("", systemImage: "wallet.bifold.fill") {
                WatchlistView()
            }
            Tab(role: .search) {
                
            }
        }
    }
}

#Preview {
    ViewLoader()
}
