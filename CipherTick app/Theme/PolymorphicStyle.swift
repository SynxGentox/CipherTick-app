//
//  ButtonDIsHelper.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 01/04/26.
//

import SwiftUI

//protocol ButtonDisHelper {
//    func isImage(from str: String) -> any View
//}
//
//extension Text: ButtonDisHelper {
//    public func isImage(from str: String) -> any View {
//        Text(str)
//    }
//}


struct PolymorphicButtonStyle: View {
    let isImage: String
    let infinite: Bool
    let alignLeft: Bool
    var body: some View {
        isImage(str: isImage)
    }
    @ViewBuilder
    func isImage(str: String) -> some View {
        if UIImage(systemName: str) != nil {
            Image(systemName: str)
                .iconStyle(
                    buttonHeight: ButtonT.HeightT.medium,
                    buttonWidth: infinite ? ButtonT.WidthT.infinite : ButtonT.WidthT.medium,
                    iconColor: GetColor.accent, alignLeft: alignLeft
                )
        }
        else if UIImage(named: str) != nil {
            Image(str)
                .iconStyle(
                    buttonHeight: ButtonT.HeightT.medium,
                    buttonWidth: infinite ? ButtonT.WidthT.infinite : ButtonT.WidthT.medium,
                    iconColor: GetColor.accent, alignLeft: alignLeft
                )
        }
        else {
            Text(str)
                .amountFontStyleExt(numSize: FontT.primary)
                .foregroundStyle(GetColor.accent)
                .padding(ButtonT.IconPaddingT.medium)
                .frame(
                    maxWidth: infinite ? ButtonT.WidthT.infinite : ButtonT.WidthT.medium,
                    maxHeight: ButtonT.HeightT.small
                )
        }
    }
}
