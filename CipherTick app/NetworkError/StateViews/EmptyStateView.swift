//
//  EmptyStateView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 08/04/26.
//

import SwiftUI

struct EmptyStateView: View {
    
    var body: some View {
        let size: CGFloat = 50
        
        VStack {
            Image(systemName: "questionmark.folder")
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
            Text("Unable to load data!")
                // Font Style
        }
        .padding(24)
    }
}

#Preview {
    EmptyStateView()
}
