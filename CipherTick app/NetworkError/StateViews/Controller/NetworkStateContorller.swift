//
//  NetworkStateController.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 11/04/26.
//

import SwiftUI

struct NetworkStateController: View{
    let state: NetworkState
    var onRetry: () -> Void
    
    var body: some View {
        switch state {
        case .isEmpty:
            ZStack{
                EmptyStateView()
                VStack {
                    Spacer()
                    Button {
                        onRetry()
                    } label: {
                        Image(systemName: "arrow.trianglehead.counterclockwise")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .fontWeight(.semibold)
                    }
                    Spacer().frame(height: 240)
                }
            }
            
        case .isError(let error):
                ZStack{
                    ErrorStateView(error: error)
                    VStack {
                        Spacer()
                        Button {
                            onRetry()
                        } label: {
                            Image(systemName: "arrow.trianglehead.counterclockwise")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .fontWeight(.semibold)
                        }
                        Spacer().frame(height: 240)
                    }
                }
        case .isLoading:
            LoadingStateView()
        case .isSuccess:
            EmptyView()
            // Your Success View
        }
    }
}


#Preview {
    NetworkStateController(state: .isError(""), onRetry: {})
}

