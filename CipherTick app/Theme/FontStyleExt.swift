//
//  GeneralFontExt.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct PrimaryFontStyle: ViewModifier {
    let fontSize: CGFloat
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.primary)
            .font(
                .system(size: fontSize, weight: .medium, design: .monospaced)
            )
    }
}

extension View {
    func primaryFontStyleExt(fontSize: CGFloat) -> some View {
        modifier(PrimaryFontStyle(fontSize: fontSize))
    }
}

struct SecondaryFontStyle: ViewModifier {
    let fontSize: CGFloat
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.secondary)
            .font(
                .system(size: fontSize, weight: .medium, design: .monospaced)
            )
    }
}

extension View {
    func secondaryFontStyleExt(fontSize: CGFloat) -> some View {
        modifier(SecondaryFontStyle(fontSize: fontSize))
    }
}


struct AmountFontStyle: ViewModifier {
    let numSize: CGFloat
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.primary)
            .font(
                .system(size: numSize, weight: .medium, design: .default)
            )
            
    }
}

extension View {
    func amountFontStyleExt(numSize: CGFloat) -> some View {
        modifier(AmountFontStyle(numSize: numSize))
    }
}
