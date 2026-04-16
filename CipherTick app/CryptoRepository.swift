//
//  CryptoRepository.swift
//  CipherTick app
//
//  Created by Aryan Verma on 16/04/26.
//

import Foundation

protocol CryptoRepository {
    func fetch() async throws -> [Coin]
}

final class CryptoRepositoryImpl: CryptoRepository {
    private let network: NetworkServiceProtocol
    
    init(network: NetworkServiceProtocol = NetworkService()) {
        self.network = network
    }
    
    func fetch() async throws -> [Coin] {
        let url = try URLConstructor.coinURL(Endpoint.Coins.markets(currency: "usd", perPage: 20))
        let data = try await network.fetchData(url: url)
        return try JSONDecoder().decode([Coin].self, from: data)
    }
}
