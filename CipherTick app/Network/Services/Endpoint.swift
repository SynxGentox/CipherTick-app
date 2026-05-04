//
//  Endpoint.swift
//  CipherTick app
//
//  Created by Aryan Verma on 16/04/26.
//

import Foundation

enum Namespace: String {
    case coin
    case chart
    case search
    case global
    case nfts
    case categories
    case onChain
    case exchange
    case treasury
    
    var errorValue: String {
        switch self {
            case .nfts:
                return "NFTs"
            case .onChain:
                return " On Chain"
            default:
                return self.rawValue.capitalized
        }
    }
}

protocol EndpointType {
    var path: String { get }
    var isFeatureDisableError: Optional<APIError> { get }
}

// MARK: - Coins & Tokens
enum Coins: EndpointType {
    case markets(currency: String, perPage: Int)
    case detail(id: String)
    case history(id: String, date: String)
    
    var path: String {
        switch self {
            case .markets(let currency, let perPage):
                return "/coins/markets?vs_currency=\(currency)&per_page=\(perPage)"
            case .detail(let id):
                return "/coins/\(id)"
            case .history(let id, let date):
                return "/coins/\(id)/history?date=\(date)"
        }
    }
    
    var isFeatureDisableError: APIError? {
        if !APIConfig.shared.isEnabledCoin {
            return APIError.featureDisabled(Namespace.coin.errorValue)
        }
        return nil
    }
}
// MARK: - Historical Charts
enum Charts: EndpointType {
    
    var isFeatureDisableError: APIError? {
        return APIError.featureDisabled(Namespace.chart.errorValue)
    }
    
    case marketChart(id: String, currency: String, days: Int)
    case ohlc(id: String, currency: String, days: Int)
    
    var path: String {
        switch self {
            case .marketChart(let id, let currency, let days):
                return "/coins/\(id)/market_chart?vs_currency=\(currency)&days=\(days)"
            case .ohlc(let id, let currency, let days):
                return "/coins/\(id)/ohlc?vs_currency=\(currency)&days=\(days)"
        }
    }
}

// MARK: - Search & Discovery
enum Search: EndpointType {
    
    var isFeatureDisableError: APIError? {
        return APIError.featureDisabled(Namespace.search.errorValue)
    }
    
    case trending
    case query(term: String)
    
    var path: String {
        switch self {
            case .trending:
                return "/search/trending"
            case .query(let term):
                return "/search?query=\(term)"
        }
    }
}

// MARK: - Global
enum Global: EndpointType {
    
    var isFeatureDisableError: APIError? {
        return APIError.featureDisabled(Namespace.global.errorValue)
    }
    
    case overview
    case defi
    
    var path: String {
        switch self {
            case .overview: return "/global"
            case .defi: return "/global/decentralized_finance_defi"
        }
    }
}

// MARK: - NFTs
enum NFTs: EndpointType {
    
    var isFeatureDisableError: APIError? {
        return APIError.featureDisabled(Namespace.nfts.errorValue)
    }
    
    case list
    case detail(id: String)
    
    var path: String {
        switch self {
            case .list: return "/nfts/list"
            case .detail(let id): return "/nfts/\(id)"
        }
    }
}

// MARK: - Categories
enum Categories: EndpointType {
    
    var isFeatureDisableError: APIError? {
        return APIError.featureDisabled(Namespace.categories.errorValue)
    }
    
    case list
    case marketData
    
    var path: String {
        switch self {
            case .list: return "/coins/categories/list"
            case .marketData: return "/coins/categories"
        }
    }
}

// MARK: - On-chain DEX
enum OnChain: EndpointType {
    
    var isFeatureDisableError: APIError? {
        return APIError.featureDisabled(Namespace.onChain.errorValue)
    }
    
    case pools(network: String)
    case trades(poolAddress: String)
    
    var path: String {
        switch self {
            case .pools(let network):
                return "/onchain/networks/\(network)/pools"
            case .trades(let poolAddress):
                return "/onchain/networks/eth/pools/\(poolAddress)/trades"
        }
    }
}

// MARK: - Exchange & Derivatives
enum Exchanges: EndpointType {
    
    var isFeatureDisableError: APIError? {
        return APIError.featureDisabled(Namespace.exchange.errorValue)
    }
    
    case list
    case detail(id: String)
    case derivatives
    
    var path: String {
        switch self {
            case .list: return "/exchanges"
            case .detail(let id): return "/exchanges/\(id)"
            case .derivatives: return "/derivatives"
        }
    }
}

// MARK: - Public Treasury
enum Treasury: EndpointType {
    
    var isFeatureDisableError: APIError? {
        return APIError.featureDisabled(Namespace.treasury.errorValue)
    }
    
    case companies(coinId: String)
    
    var path: String {
        switch self {
            case .companies(let coinId):
                return "/companies/public_treasury/\(coinId)"
        }
    }
}

