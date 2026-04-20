//
//  ViewLoader.swift
//  CipherTick app
//
//  Created by Aryan Verma on 15/04/26.
//

import SwiftUI

struct ViewLoader: View {
    @State private var viewModel = CoinsViewModel(repository: CryptoRepositoryImpl())
    var body: some View {
        NetworkStateController(state: viewModel.appState) {
                    Task { await viewModel.fetch() }
                } success: {
                    TabView {
                        Tab("", systemImage: "coloncurrencysign.circle.fill") {
                            NavigationStack {
                                MarketView(filteredCoin: viewModel.filteredItems, searchText: $viewModel.searchText, doRefresh: doRefresh)
                                    .navigationDestination(for: AppRoute.self) { route in
                                        switch route {
                                        case .coinDetail(let coin):
                                            Text(coin.name) // placeholder
                                        }
                                    }
                            }
                        }
                        Tab("", systemImage: "square.fill.on.circle.fill") {}
                        Tab("", systemImage: "coloncurrencysign.bank.building.fill") {}
                        Tab("", systemImage: "wallet.bifold.fill") {}
                    }
                }
                .task { await viewModel.fetch() }
    }
    func doRefresh() async {
        await viewModel.manualRefresh()
    }
}

#Preview {
    ViewLoader()
}
