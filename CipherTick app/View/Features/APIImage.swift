//
//  APIImage.swift
//  CipherTick app
//
//  Created by Aryan Verma on 22/04/26.
//

import SwiftUI

struct APIImage: View {
    let image: String

    var body: some View {
        AsyncImage(url: URL(string: image)) { phase in
            if let image = phase.image {
                image
                    .iconStyle(buttonHeight: ButtonT.HeightT.medium,
                               buttonWidth: ButtonT.WidthT.medium,
                               iconColor: GetColor.primary,
                               alignLeft: false)
                
            } else if phase.error != nil {
                VStack {
                    Image(systemName: "exclamationmark.triangle")
                        .foregroundStyle(GetColor.deepRed)
                }
            }
            else {
                ProgressView()
            }
        }
    }
}
