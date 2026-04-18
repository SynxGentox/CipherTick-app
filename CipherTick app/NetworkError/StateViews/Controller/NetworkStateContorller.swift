//
//  NetworkStateContorller.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 11/04/26.
//

import SwiftUI

struct NetworkStateContorller: View{
    let state: NetworkState
    
    var body: some View {
        switch state {
        case .isEmpty:
            ZStack{
                EmptyStateView()
                VStack {
                    Spacer()
                    Button {
                        
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
    NetworkStateContorller(state: .isError(""))
}

