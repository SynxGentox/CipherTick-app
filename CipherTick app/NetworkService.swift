//
//  NetworkService.swift
//  CipherTick app
//
//  Created by Aryan Verma on 15/04/26.
//

import Foundation


protocol NetworkServiceProtocol {
    func fetchData(url: URL) async throws -> Data
}

/// API service fetching
struct NetworkService: NetworkServiceProtocol {
     func fetchData(url: URL) async throws -> Data {
         var request = URLRequest(url: url)
         
         if APIConfig.shared.useAPIKey {
             request.setValue(APIKey.key, forHTTPHeaderField: "x-cg-demo-api-key")
         }
         else {
             
         }
         let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else  {
            throw APIError.networkError(0)
        }
        return data
    }
}
