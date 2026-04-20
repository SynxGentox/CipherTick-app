//
//  SkeletonFlashFeat.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import SwiftUI

struct SkeletonFlashView: View {
    @State var isAnimating: Bool
    var size: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: value, style: .continuous)
            .fill(.white.opacity(0.6))   // color of flash
            .frame(maxWidth: size / 2,
                   maxHeight: size)
//            .rotationEffect(Angle(degrees: angle))
            .blur(radius: value * 3)
            .offset(x: isAnimating ? -(size + size) : size + size)
            .onAppear {
                withAnimation(.linear(duration: xSeconds).repeatForever(autoreverses: false)) {
                    isAnimating.toggle()
                }
            }
            .ignoresSafeArea()
    }
    var angle: CGFloat {
        10
    }
    var xSeconds: Double {
        1.4
    }
    var value: CGFloat {
        8
    }
}

#Preview {
    SkeletonFlashView(isAnimating: true, size: 200)
}
