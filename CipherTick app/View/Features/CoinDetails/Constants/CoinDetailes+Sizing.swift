//
//  CoinDetails+Sizing.swift
//  CipherTick app
//
//  Created by Aryan Verma on 03/05/26.
//
import Foundation

extension CoinDetailsView {
    protocol Sizing {
        var viewVSpacing: CGFloat { get }
    }
    
    struct RegularSizing: Sizing {
        var viewVSpacing: CGFloat { 20 }
    }
    struct CompactSizing: Sizing {}
}

extension CoinDetailsView.Sizing {
    var viewVSpacing: CGFloat { 16 }
}
