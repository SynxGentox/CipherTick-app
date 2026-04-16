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
    var appState: AppState = .isLoading
    var error: APIError?
    private let repository: CryptoRepository
    
    init(error: APIError?, repository: CryptoRepository) {
        self.error = error
        self.repository = repository
    }
    
    
    func fetch() async {
        appState = .isLoading
        do {
            let result = try await repository.fetch()
            if result.first?.id == nil {
                appState = .isEmpty {
                    Task { await self.fetch() }
                }
            } else {
                coins = result
                appState = .isSuccess
            }
        } catch {
            appState = .isError(error) {
                Task { await self.fetch() }
            }
        }
    }
}
