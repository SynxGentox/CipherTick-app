//
//  NetworkService.swift
//  CipherTick app
//
//  Created by Aryan Verma on 15/04/26.
//

import Foundation


// MARK: - NetworkSevice Protocol
protocol NetworkServiceProtocol {
    func fetchData(url: URL) async throws -> Data
}

// MARK: - API Service Fetcher
struct NetworkService: NetworkServiceProtocol {
     func fetchData(url: URL) async throws -> Data {
         var request = URLRequest(url: url)
         
         if APIConfig.shared.useAPIKey {
             request.setValue(APIKey.key, forHTTPHeaderField: "x-cg-demo-api-key")
         }
         
         
         let (data, response) = try await URLSession.shared.data(for: request)
         
         guard let httpError = response as? HTTPURLResponse else {
             throw APIError.networkError(0)
        }
         guard httpError.statusCode == 200 else {
             throw APIError.networkError(httpError.statusCode)
         }
        return data
    }
}
