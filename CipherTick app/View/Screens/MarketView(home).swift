//
//  MarketView(home).swift
//  CipherTick app
//
//  Created by Aryan Verma on 18/04/26.
//

import SwiftUI

struct MarketView: View {
    let filteredCoin: [Coin]
    @Binding var searchText: String
    let doRefresh: () async -> Void
    
    var body: some View {
        FeatureEnabler(flag: APIConfig.shared.isEnabledCoin) {
            
            ZStack {
                GetColor.customBlack
                VStack{
                    Card(radius: CardT.RadiusOrPaddingT.smoothRadius,
                         width: CardT.WidthT.infinity,
                         height: CardT.HeightT.xLarge,
                         color: GetColor.customBlack
                    )
                    Card(radius: CardT.RadiusOrPaddingT.smoothRadius,
                         width: CardT.WidthT.infinity,
                         height: CardT.HeightT.large,
                         color: GetColor.customGreen
                    )
                    ZStack {
                        Card(radius: CardT.RadiusOrPaddingT.smoothRadius,
                             width: CardT.WidthT.infinity,
                             height: CardT.HeightT.infinity,
                             color: GetColor.customGreen
                        )
                        ScrollView {
                            Spacer().frame(height: 60)
                            VStack {
                                ItemListView(filteredCoin: filteredCoin)
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .searchable(text: $searchText, prompt: "Search coins, symbols...")
            .refreshable {
                await doRefresh()
            }
        }
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
    
    MarketView(
        filteredCoin: dummyData,
        searchText: .constant("Searh coin,symbols..."),
        doRefresh: {
        })
}
