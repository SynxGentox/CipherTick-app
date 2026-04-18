//
//  ErrorStateView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 08/04/26.
//

import SwiftUI

struct ErrorStateView: View {
    let error: String?
    
    var body: some View {
        let size: CGFloat = 170   // size of flash and image
        VStack(spacing: 0) {
            ZStack {
                Image(systemName: "xmark.icloud.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: size, maxHeight: size)
                    .foregroundStyle(.orange)
                    .symbolEffect(.breathe)
                    .symbolRenderingMode(.multicolor)
                SkeletonFlashView(isAnimating: true, size: size)
                    .blendMode(.destinationOut)
            }
            Text("Error Connecting: \(String(describing: error ?? "Something went wrong"))")
                // font style
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
        }
        .compositingGroup()
    }
}

#Preview {
    // Inject a trailing closure that just prints to the console
    ErrorStateView(error: "URLError(.notConnectedToInternet)")
}
