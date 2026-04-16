//
//  URLConstructor.swift
//  CipherTick app
//
//  Created by Aryan Verma on 16/04/26.
//

import Foundation

/// URL manufacturer
enum URLConstructor {
    
    /// holds the bases url either
    private static var baseURL: String {
        APIConfig.shared.isPremium ?
        "https://pro-api.coingecko.com/api/v3" : "https://api.coingecko.com/api/v3"
    }
    
    
    
    //URl-Constructor
    static func build(_ nameSpace: String) throws -> URL {
        let raw = baseURL + nameSpace
        guard let url = URL(string: raw) else {
            throw URLError(.badURL)
        }
        return url
    }
    
    
    
    //Feature-builder
    static func coinURL(_ endpoint: Endpoint.Coins) throws -> URL {
        guard APIConfig.shared.isEnabledCoin else {
            throw APIError.featureDisabled("Coins")
        }
        return try build(endpoint.path)
    }
    
    
    static func chartURL(_ endpoint: Endpoint.Charts) throws -> URL {
        guard APIConfig.shared.isEnabledChart else {
            throw APIError.featureDisabled("Charts")
        }
        return try build(endpoint.path)
    }
    
    
    static func searchURL(_ endpoint: Endpoint.Search) throws -> URL {
        guard APIConfig.shared.isEnabledSearch else {
            throw APIError.featureDisabled("Search")
        }
        return try build(endpoint.path)
    }
    
    
    static func globalURL(_ endpoint: Endpoint.Global) throws -> URL {
        guard APIConfig.shared.isEnabledGlobal else {
            throw APIError.featureDisabled("Global")
        }
        return try build(endpoint.path)
    }
    
    
    static func nftsURL(_ endpoint: Endpoint.NFTs) throws -> URL {
        guard APIConfig.shared.isEnabledNFT else {
            throw APIError.featureDisabled("NFTs")
        }
        return try build(endpoint.path)
    }
    
    
    static func categoriesURL(_ endpoint: Endpoint.Categories) throws -> URL {
        guard APIConfig.shared.isEnabledCategory else {
            throw APIError.featureDisabled("Categories")
        }
        return try build(endpoint.path)
    }
    
    
    static func excahangeURL(_ endpoint: Endpoint.Exchanges) throws -> URL {
        guard APIConfig.shared.isEnabledExchange else {
            throw APIError.featureDisabled("Exchanges")
        }
        return try build(endpoint.path)
    }
    
    
    static func onChainURL(_ endpoint: Endpoint.OnChain) throws -> URL {
        guard APIConfig.shared.isEnabledOnChange else {
            throw APIError.featureDisabled("OnChain")
        }
        return try build(endpoint.path)
    }
    
    
    static func treasuryURL(_ endpoint: Endpoint.Treasury) throws -> URL {
        guard APIConfig.shared.isEnabledTreasury else {
            throw APIError.featureDisabled("Treasury")
        }
        return try build(endpoint.path)
    }
    
    
}
