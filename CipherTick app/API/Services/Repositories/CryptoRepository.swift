//
//  CryptoRepository.swift
//  CipherTick app
//
//  Created by Aryan Verma on 16/04/26.
//

import Foundation

// MARK: - Repository Protocol
protocol CryptoRepository {
    func fetch() async throws -> [Coin]
    func fetchDetails(id: String) async throws -> CoinDetails
}

// MARK: - Respository & URL Sharing
final class CryptoRepositoryImpl: CryptoRepository {
    private let network: NetworkServiceProtocol
    
    init(network: NetworkServiceProtocol = NetworkService()) {
        self.network = network
    }
    
// MARK: - Coin URL Sender
    func fetch() async throws -> [Coin] {
        let url = try URLConstructor.coinURL(Endpoint.Coins.markets(currency: "usd", perPage: 20))
        let data = try await network.fetchData(url: url)
        return try JSONDecoder().decode([Coin].self, from: data)
    }
   
// MARK: - CoinDetails URL Sender
    func fetchDetails(id: String) async throws -> CoinDetails {
        let url = try URLConstructor.coinURL(Endpoint.Coins.detail(id: id))
        let data = try await network.fetchData(url: url)
        return try JSONDecoder().decode(CoinDetails.self, from: data)
    }
}
