//
//  ViewLoader.swift
//  CipherTick app
//
//  Created by Aryan Verma on 15/04/26.
//

import SwiftUI

struct ViewLoader: View {
    @State private var viewModel = CoinsViewModel(error: nil, repository: CryptoRepositoryImpl())
    var body: some View {
        Group {
            switch viewModel.appState {
                case .isSuccess:
                    MarketView(coins: viewModel.coins)
                default:
                    NetworkStateController(state: viewModel.appState) {
                        Task { await viewModel.fetch() }
                    }
            }
        }
        .task { await viewModel.fetch() }
    }
}

#Preview {
    ViewLoader()
}
