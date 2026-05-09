//
//  TopCoinsView.swift
//  CipherTick app
//
//  Created by Aryan Verma on 06/05/26.
//

import SwiftUI

struct TopCoinsView: View {
    let sortedCoin: [Coin]
    @State var index = 1
    var body: some View {
        ZStack {
            HStack(spacing: 1) {
                ForEach (sortedCoin.prefix(3), id: \.id) { coin in
                    ZStack {
                        Color.clear
                            .card(color: GetColor.plum.opacity(0.9), radius: CardT.RadiusOrPaddingT.smoothRadius)
                            .frame(maxWidth: .infinity, minHeight: CardT.HeightT.medium, maxHeight: CardT.HeightT.medium)
                        
                        VStack(spacing: 0) {
                            APIImage(image: coin.image ?? "exclamationmark.trianglepath")
                            VStack(alignment: .leading) {
                                Text(coin.name)
                                Text("CRank: \(coin.marketCapRank ?? 0)")
                                
                                Text(coin.price ?? 0.0, format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                            }
                        }
                        .padding(.vertical)
                        .foregroundStyle(GetColor.milkWhite)
                        .font(
                            .system(size: FontT.secondary, weight: .semibold, design: .monospaced)
                        )
                    }
                    
                }
                
            }
        }
        
    }
}

#Preview {
    let dummyData = Array(arrayLiteral: Coin(
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
    ), Coin(
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
    ),
                          Coin(
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
                          ))
    TopCoinsView(sortedCoin: dummyData)
}
