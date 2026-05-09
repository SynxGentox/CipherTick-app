//
//  CoinsOverView.swift
//  CipherTick app
//
//  Created by Aryan Verma on 06/05/26.
//

import SwiftUI

struct CoinsOverView: View {
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false ) {
                HStack {
                    ForEach(0..<3)  {_ in
                        Color.clear
                            .card(color: GetColor.plum.opacity(0.9), radius: CardT.RadiusOrPaddingT.sharpRadius)
                            .frame(width: 400)
                    }
                    
                }
                .padding(.horizontal, 1)
            }
            Text("Carosel like coin page view")
                .foregroundStyle(Color.milkWhite)
        }
        .frame(height: CardT.HeightT.large)
    }
}

#Preview {
    CoinsOverView()
}
