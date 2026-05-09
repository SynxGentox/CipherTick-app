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
            NavigationLink(value: AppRoute.coinDetail(coin)) {
                HStack {
                    // Change the Image to CoinImage funciton to getch the image from the server the string provided by the API
                    APIImage(image: coin.image ?? "exclamationmark.trianglepath")
                      
                    /// Got to iconStyle.swift to edit the iconStyle
                    VStack(alignment: .listRowSeparatorLeading) {
                        Text(coin.name)
                            .primaryStyle(fontSize: FontT.primary)
                            .minimumScaleFactor(0.8)
                            .lineLimit(2)
                        Text("(\(coin.symbol.uppercased()))")
                            .secondaryStyle(fontSize: FontT.secondary)
                            .minimumScaleFactor(0.8)
                            .lineLimit(1)
                    }
                    .frame(width: 80, alignment: .leading)
                    
                    Spacer(minLength: .zero)
                    
                    Color.clear
                        .card(color: .gray.opacity(0.3),
                              radius: CardT.RadiusOrPaddingT.sharpRadius)
                        .frame(width: CardT.WidthT.medium,
                               height: CardT.HeightT.small)
                    
                    
                    VStack(alignment: .listRowSeparatorTrailing) {
                        Text(
                            coin.price ?? .zero,
                            format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                        )
                        .foregroundStyle(getPercentageColor(coin.changePercent ?? .zero))
                        .amountStyle(fontSize: FontT.primary)
                        .minimumScaleFactor(0.4)
                        .lineLimit(1)
                        
                        let change = coin.changePercent ?? 0.00
                        let prefix = change >= 0 ? "+" : ""
                        let formatted = change.formatted(.number.precision(.fractionLength(2)))
                        
                        Text("\(prefix)\(formatted)%")
                            .secondaryStyle(fontSize: FontT.secondary)
                    }
                    .frame(width: 100, alignment: .trailing)
                }
                .frame(maxHeight: 65)
            }
            .buttonStyle(.plain)
        }
    }
      
    func getPercentageColor(_ percentage: Double) -> Color {
        percentage >= .zero ? GetColor.kiwi : GetColor.imperialRed
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
    ListItemView(coin: dummyData)
}
