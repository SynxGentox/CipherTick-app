//
//  RootView.swift
//  CipherTick app
//
//  Created by Aryan Verma on 19/04/26.
//

import SwiftUI

struct RootView: View {
    @State private var appRoute: [AppRoute] = []
    var body: some View {
        ViewLoader()
    }
}

#Preview {
    RootView()
}
