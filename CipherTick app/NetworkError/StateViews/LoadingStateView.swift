//
//  SkeletonLoadingView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import SwiftUI

struct LoadingStateView: View {
    var body: some View {
        let sizes: [CGFloat] = [250, 150, 100]

        VStack(spacing: 5) {
            ForEach(sizes, id: \.self) { size in
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .frame(height: size) // No need for maxWidth: .infinity, it does that natively
                        .foregroundColor(Color(.systemGray6))
                    ContentSkeletonView(contentSize: size)
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    LoadingStateView()
}
