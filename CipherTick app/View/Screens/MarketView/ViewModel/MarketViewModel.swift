//
//  MarketViewModel.swift
//  CipherTick app
//
//  Created by Aryan Verma on 16/04/26.
//

import Foundation
import Observation

@Observable
@MainActor
final class MarketViewModel {
    var coins: [Coin] = []
    var appState: NetworkState = .isLoading
    var searchText: String = ""
    private let repository: CryptoRepository
    private var lastManualRefresh: Date? = nil
    private var refreshInterval: TimeInterval {
        APIConfig.shared.isKeyPremium ? APIConfig.shared.premiumKeyDelay : APIConfig.shared.demoKeyDelay
    }
    private var isFetching = false
    var selectedSort: SortOptions = .all
    
    init(repository: CryptoRepository) {
        self.repository = repository
    }
    
    func fetch() async {
        guard !isFetching else { return }
        isFetching = true
        if coins.isEmpty { appState = .isLoading}
        do {
            let result = try await repository.fetch()
            if result.isEmpty {
                appState = .isEmpty
            } else {
                coins = result
                appState = .isSuccess
            }
        } catch {
            appState = .isError(error.localizedDescription)
        }
        isFetching = false
    }
    
    func manualRefresh() async {
        if let last = lastManualRefresh, Date.now.timeIntervalSince(last) < refreshInterval {
            return
        }
        lastManualRefresh = .now
        try? await Task.sleep(nanoseconds: 330_000_000)
        await fetch()
    }
    
    var sortedArray: [Coin] {
        var result = coins
        
        if !searchText.isEmpty {
            return coins.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.symbol.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        result.sort { lhs, rhs in
            switch selectedSort {
                case .change24h:
                    guard let l = lhs.changePercent else { return false }
                    guard let r = rhs.changePercent else { return true }
                    return l > r
                case .marketCap:
                    guard let l = lhs.marketCap else { return false }
                    guard let r = rhs.marketCap else { return true }
                    return l > r
                case .price:
                    guard let l = lhs.price else { return false }
                    guard let r = rhs.price else { return true }
                    return l > r
                case .trending:
                    guard let l = lhs.changePercent else { return false }
                    guard let r = rhs.changePercent else { return true }
                    return l > r
                case .all:
                    return (lhs.marketCapRank ?? Int.max) < (rhs.marketCapRank ?? Int.max)
            }
        }
        return result
    }
    
    var greeting: String {
        let hour = Calendar.current.component(.hour, from: .now)
        switch hour {
        case 5..<12: return "Good morning"
        case 12..<17: return "Good afternoon"
        default: return "Good evening"
        }
    }
    // more code...
}
