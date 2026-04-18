//
//  ListItem.swift
//  CipherTick app
//
//  Created by Aryan Verma on 17/04/26.
//

import SwiftUI

struct ListItemView: View {
    let coin: Coin
    var body: some View {
        FeatureEnabler(flag: APIConfig.shared.isEnabledCoin) {
            HStack {
                // Change the Image to CoinImage funciton to getch the image from the server the string provided by the API
                Image(systemName: "circle.fill")
                /// Got to iconStyle.swift to edit the iconStyle
                    .iconStyle(buttonHeight: ButtonT.HeightT.medium,
                               buttonWidth: ButtonT.WidthT.medium,
                               iconColor: GetColor.primary,
                               alignLeft: false)
                VStack(alignment: .listRowSeparatorLeading) {
                    Text(coin.name)
                        .primaryStyle(fontSize: FontT.primary)
                    Text("(\(coin.symbol))")
                        .secondaryStyle(fontSize: FontT.primary - 3)
                }
                
                Spacer()
                
                Card(radius: CardT.RadiusOrPaddingT.smoothRadius,
                     width: CardT.WidthT.medium,
                     height: CardT.HeightT.infinity,
                     color: GetColor.accent)
                
                
                Spacer()
                
                VStack(alignment: .listRowSeparatorTrailing) {
                    Text(coin.price ?? 0.00, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundStyle( coin.changePercent ?? 0.00 >= 0 ? GetColor.metallicGold : GetColor.deepRed)
                        .amountStyle(fontSize: FontT.primary)
                    Text((coin.changePercent ?? 0.00 >= 0 ? "+" : "")
                         + (coin.changePercent ?? 0.00).formatted(.number.precision(.fractionLength(2)))
                         + "%")
                        .secondaryStyle(fontSize: FontT.primary - 3)
                    
                }
                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: 65)
        }
    }
        
}

#Preview {
    let dummyData = Coin(
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
    )
    ListItemView(coin: dummyData)
}
