//
//  ifView.swift
//  CipherTick app
//
//  Created by Aryan Verma on 07/05/26.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Content: View> (_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
