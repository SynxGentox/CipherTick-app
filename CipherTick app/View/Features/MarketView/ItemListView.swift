//
//  ItemListView.swift
//  CipherTick app
//
//  Created by Aryan Verma on 18/04/26.
//

import SwiftUI

struct ItemListView: View {
    let coin: [Coin]
    let filterItem = ["Trending", "Price", "Market Cap", "24h_change"]
    var body: some View {
        
        HStack {
            ForEach(filterItem, id: \.self) { item in
                Text(item)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 5)
                
                    .buttonStyle(ActionButtonStyle(isSelected: true))
            }
            .secondaryStyle(fontSize: FontT.secondary)
            Spacer()
        }
        .secondaryStyle(fontSize: FontT.secondary)
        ForEach(coin, id: \.id) { coin in
            ListItemView(coin: coin)
            Divider()
                .padding(.horizontal, ButtonT.IconPaddingT.large)
        }
        .padding(.horizontal, ButtonT.IconPaddingT.small)
        .background(.blue)
    }
}

#Preview {
    let dummyData = Array(arrayLiteral: Coin(
        id: "sfd",
        name: "dsf",
        symbol: "dsf",
        image: "fdg",
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
                            id: "sfd",
                            name: "dsf",
                            symbol: "dsf",
                            image: "fdg",
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
    
    ItemListView(coin: dummyData)
}
