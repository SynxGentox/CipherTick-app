//
//  CoinDetailsView.swift
//  CipherTick app
//
//  Created by Aryan Verma on 21/04/26.
//

//
//  CoinDetailView.swift
//  CipherTick app
//

import SwiftUI

struct CoinDetailsView: View {
    let coin: Coin
    @State private var viewModel: CoinDetailsViewModel
    
    init(coin: Coin) {
        self.coin = coin
        _viewModel = State(initialValue: CoinDetailsViewModel(coinId: coin.id))
    }
    
    var body: some View {
        NetworkStateController(state: viewModel.appState) {
            Task { await viewModel.fetch() }
        } success: {
            if let detail = viewModel.coinDetails {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        AsyncImage(url: URL(string: detail.image.large)) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            Circle().fill(GetColor.sysGray)
                        }
                        .frame(width: 80, height: 80)
                        
                        Text(detail.name)
                            .primaryStyle(fontSize: FontT.title)
                        
                        Text(detail.symbol.uppercased())
                            .secondaryStyle(fontSize: FontT.secondary)
                        
                        if let price = detail.marketData.price["usd"] {
                            Text(price, format: .currency(code: "USD"))
                                .amountStyle(fontSize: FontT.primary)
                        }
                        
                        if let change = detail.marketData.priceChangePercentPerDay {
                            let value = change.first?.value ?? 0.0
                            let prefix = value >= 0.0 ? "+" : ""
                            let formatter = (value.formatted(.number.precision(.fractionLength(2))))
                            Text("\(prefix)\(formatter)%")
                                .foregroundStyle((change.first?.value ?? 0.0) >= 0.0 ? GetColor.customGreen : GetColor.deepRed)
                        }
                        
                        if let desc = detail.description.en, !desc.isEmpty {
                            Text(desc)
                                .secondaryStyle(fontSize: FontT.secondary)
                                .padding(.top, 8)
                        }
                    }
                    .padding()
                }
            }
        }
        .task { await viewModel.fetch() }
        .navigationTitle(coin.name)
    }
}

#Preview {
    let dummyData = Coin(
        id: "bitcoin",
        name: "Bitcoin",
        symbol: "btc",
        image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
        price: 234.3,
        marketCap: 343.3,
        volume: 34.4,
        marketCapRank: 3,
        priceChange: 23.3,
        changePercent: 324.3,
        high24hr: 3.4,
        low24hr: 45.4,
        lastUpdated: "fs"
    )
    
    CoinDetailsView(coin: dummyData)
}
