//
//  ContentSkeletonFeat.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import SwiftUI

struct ContentSkeletonView: View {
    let contentSize: CGFloat

    var body: some View {
        let concentricInset: CGFloat = 30
        let size: CGFloat = contentSize - concentricInset
        
        // 1. Extract the raw shapes into a variable so we can reuse them as a mask
        ZStack {
            HStack(alignment: .top, spacing: size / 7) {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .frame(minWidth: size, minHeight: size)
                    
                VStack(alignment: .leading, spacing: size/5) {
                    ForEach(0..<3) { _ in
                        Capsule(style: .continuous)
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                minHeight: size/8,
                                maxHeight: size/8
                            )
                    }
                }
            }
            .frame(minWidth: size, maxHeight: size)
            .foregroundColor(Color(.systemGray5))
            .padding(16)
            SkeletonFlashView(isAnimating: true, size: size)
                .blendMode(.destinationOut)
        }
        .compositingGroup()
    }
}

#Preview {
    ContentSkeletonView(contentSize: 210)
}
