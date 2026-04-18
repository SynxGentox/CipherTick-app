//
//  ListItem.swift
//  CipherTick app
//
//  Created by Aryan Verma on 17/04/26.
//

import SwiftUI

struct ListItemView: View {
    var body: some View {
        FeatureEnabler(flag: APIConfig.shared.isEnabledCoin) {
            HStack {
                Image(systemName: "square.fill")
                    .iconStyle(buttonHeight: ButtonT.HeightT.medium, buttonWidth: ButtonT.WidthT.medium, iconColor: GetColor.primary, alignLeft: false)
                    Spacer()
            }
            .padding(.leading, ButtonT.IconPaddingT.medium)
            .frame(maxWidth: .infinity, maxHeight: 80)
            .background(Color.blue)
        }
    }
        
}

#Preview {
    ListItemView()
}
