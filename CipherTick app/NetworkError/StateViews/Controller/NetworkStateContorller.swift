//
//  NetworkStateController.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 11/04/26.
//

import SwiftUI

struct NetworkStateController<Success: View>: View{
    let state: NetworkState
    var onRetry: () -> Void
    @ViewBuilder var success: () -> Success
    
    var body: some View {
        switch state {
        case .isEmpty:
            ZStack{
                EmptyStateView()
                VStack {
                    Spacer()
                    ActionButton(buttonDisplay: "arrow.trianglehead.counterclockwise.icloud.fill", infinite: false, alignLeft: false) {
                        onRetry()
                    }
                    Spacer().frame(height: 200)
                }
            }
            
        case .isError(let error):
                ZStack{
                    ErrorStateView(error: error)
                    VStack {
                        Spacer()
                        ActionButton(buttonDisplay: "arrow.trianglehead.counterclockwise.icloud.fill", infinite: false, alignLeft: false) {
                            onRetry()
                        }
                        Spacer().frame(height: 200)
                    }
                    HStack {
                        Spacer()
                        VStack {
                            ActionButton(buttonDisplay: "person", infinite: false, alignLeft: false) {
                                onRetry()
                            }
                            ActionButton(buttonDisplay: "gear", infinite: false, alignLeft: false) {
                                onRetry()
                            }
                            ActionButton(buttonDisplay: "ellipsis", infinite: false, alignLeft: false) {
                                onRetry()
                            }
                            Spacer()
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
        case .isLoading:
            LoadingStateView()
        case .isSuccess:
            success()
               
            // Your ViewLoader
        }
    }
}

#Preview {
    NetworkStateController(state: .isError(" nil"), onRetry: {}) {
        EmptyView()
    }
}

