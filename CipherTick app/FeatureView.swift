//
//  FeatureView.swift
//  CipherTick app
//
//  Created by Aryan Verma on 16/04/26.
//

import SwiftUI

/// Feature Flag Controls the Views according to provied namespace whether it is enabled or not 
struct FeatureView<Content: View>: View {
    let flag: Bool
    let content: () -> Content
    
    var body: some View {
        if flag { content() }
    }
}

