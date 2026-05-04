//
//  iconStyle.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

extension Image {
    func iconStyle(buttonHeight: CGFloat, buttonWidth: CGFloat, iconColor: Color, alignLeft: Bool) -> some View {
        self
            .resizable()
            .scaledToFit()
            .fontWeight(.regular)
            .foregroundStyle(iconColor)
            .padding(ButtonT.IconPaddingT.small)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignLeft ? .leading : .center)
            .frame(maxWidth: buttonWidth, maxHeight: buttonHeight)
    }
}

