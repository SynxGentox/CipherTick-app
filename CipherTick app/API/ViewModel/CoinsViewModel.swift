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
    var error: APIError?
    var searchText: String = ""
    private let repository: CryptoRepository
    
    init(error: APIError?, repository: CryptoRepository) {
        self.error = error
        self.repository = repository
    }
    
    func fetch() async {
        appState = .isLoading
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
