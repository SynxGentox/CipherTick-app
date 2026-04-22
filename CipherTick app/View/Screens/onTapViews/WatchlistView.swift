//
//  WatchlistView.swift
//  CipherTick app
//
//  Created by Aryan Verma on 22/04/26.
//


import SwiftUI

struct WatchlistView: View {
    var body: some View {
        ZStack {
            GetColor.customBlack.ignoresSafeArea()
            VStack(spacing: 16) {
                Image(systemName: "star.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundStyle(GetColor.metallicGold)
                Text("Watchlist")
                    .primaryStyle(fontSize: FontT.primary)
                Text("Coming soon")
                    .secondaryStyle(fontSize: FontT.secondary)
                
            }
        }
    }
}

#Preview {
    WatchlistView()
}
