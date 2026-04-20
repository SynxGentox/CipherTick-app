//
//  CoinsViewModel.swift
//  CipherTick app
//
//  Created by Aryan Verma on 16/04/26.
//

import Foundation
import Observation

@Observable
@MainActor
final class CoinsViewModel {
    var coins: [Coin] = []
    var appState: NetworkState = .isLoading
    var error: APIError? = nil
    var searchText: String = ""
    private let repository: CryptoRepository
    private var lastManualRefresh: Date? = nil
    private var refreshInterval: TimeInterval {
        APIConfig.shared.isKeyPremium ? APIConfig.shared.premiumKeyDelay : APIConfig.shared.demoKeyDelay
    }
    private var isFetching = false
    
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
    
    var filteredItems: [Coin] {
        searchText.isEmpty ?
        coins :
        coins.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.symbol.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    // more code...
}
