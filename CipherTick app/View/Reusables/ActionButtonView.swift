//
//  ActionButton.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct ActionButton: View {
    let buttonDisplay: String
    let infinite: Bool
    let alignLeft: Bool
    var isSelected: Bool = false
    let action: () -> Void
    
    
    var body: some View {
        VStack {
            Button(action: action) {
                PolymorphicButtonStyle(
                    isImage: buttonDisplay,
                    infinite: infinite,
                    alignLeft: alignLeft
                )
            }
            .buttonStyle(ActionButtonStyle(isSelected: isSelected))
        }
    }
}

struct ActionNavigationButton<Destination: View>: View {
    let buttonDisplay: String
    let infinite: Bool
    let alignLeft: Bool
    var isSelected: Bool = false
    let destination: Destination
    let id: String
    
    
    var body: some View {
        VStack {
            NavigationLink(value: id) {
                PolymorphicButtonStyle(
                    isImage: buttonDisplay,
                    infinite: infinite,
                    alignLeft: alignLeft
                )
            }
            .navigationDestination(for: String.self) { _ in
                EmptyView()     //Your View
            }
            .buttonStyle(ActionButtonStyle(isSelected: isSelected))
            
        }
    }
}


#Preview {
    ActionButton(buttonDisplay: "apple.homekit", infinite: false, alignLeft: false, action: {})
}
