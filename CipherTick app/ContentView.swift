//
//  ContentView.swift
//  CipherTick app
//
//  Created by Aryan Verma on 15/04/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = CoinsViewModel(error: nil,
                                          repository: CryptoRepositoryImpl())
    var body: some View {
        VStack {
            List(viewModel.coins, id: \.id) { coin in
                Text(coin.symbol)
            }
        }
        .padding()
        .task {
            await viewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
