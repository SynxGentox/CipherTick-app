//
//  TopCoinsView.swift
//  CipherTick app
//
//  Created by Aryan Verma on 06/05/26.
//

import SwiftUI

struct TopCoinsView: View {
    let sortedCoin: [Coin]
    var body: some View {
        ZStack {
            HStack {
                ForEach (sortedCoin.prefix(3), id: \.id) {coin in
                    ZStack {
                        Color.clear
                            .card(color: GetColor.persianBlue, radius: CardT.RadiusOrPaddingT.smoothRadius)
                            .frame(maxWidth: .infinity, minHeight: CardT.HeightT.medium, maxHeight: CardT.HeightT.medium)
                        
                        VStack {
                            Text(coin.name)
                                .primaryStyle(fontSize: FontT.primary)
                            APIImage(image: coin.image ?? "exclamationmark.trianglepath")
                            Text(coin.symbol)
                                .primaryStyle(fontSize: FontT.primary)
                            Text(coin.high24hr ?? 0.0, format: .number)
                                .primaryStyle(fontSize: FontT.primary)

                        }
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
