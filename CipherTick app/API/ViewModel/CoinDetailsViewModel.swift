//
//  CoinDetailsViewModel.swift
//  CipherTick app
//
//  Created by Aryan Verma on 21/04/26.
//

import Foundation
import Observation

@Observable
@MainActor
final class CoinDetailsViewModel {
    var coinDetails: CoinDetails?
    var appState: NetworkState = .isLoading
    private let repository: CryptoRepository
    private let coinId: String
    
    init(coinId: String, repository: CryptoRepository = CryptoRepositoryImpl()) {
        self.coinId = coinId
        self.repository = repository
    }
    
    func fetch() async {
        appState = .isLoading
        do {
            let result = try await repository.fetchDetails(id: coinId)
            coinDetails = result
            appState = .isSuccess
        } catch {
            appState = .isError("\(error)")
        }
    }
}
