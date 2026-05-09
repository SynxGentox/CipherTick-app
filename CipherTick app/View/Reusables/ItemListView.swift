//
//  ItemListView.swift
//  CipherTick app
//
//  Created by Aryan Verma on 18/04/26.
//

import SwiftUI

struct ItemListView: View {
    let filteredCoin: [Coin]
    @Binding var selectedSort: SortOptions
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(SortOptions.allCases, id: \.self) { options in
                    if #available(iOS 26.0, *) {
                        Text(options.rawValue)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .glassEffect()
                            .onTapGesture {
                                selectedSort = options
                            }
                    } else {
                        Text(options.rawValue)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .onTapGesture {
                                selectedSort = options
                            }
                    }
                }
                .secondaryStyle(fontSize: FontT.secondary)
            }
        }
        .safeAreaPadding(.horizontal)
        .padding(.top, 8)
       
        ForEach(filteredCoin, id: \.id) { coin in
            ListItemView(coin: coin)
            Divider()
                .padding(.horizontal, ButtonT.IconPaddingT.large)
        }
        .padding(.horizontal, ButtonT.IconPaddingT.small)
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
    ))
    
    ItemListView(filteredCoin: dummyData, selectedSort: .constant(.change24h))
}
