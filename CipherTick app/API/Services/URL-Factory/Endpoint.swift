//
//  Endpoint.swift
//  CipherTick app
//
//  Created by Aryan Verma on 16/04/26.
//

import Foundation

/// Assembly line -  constructs the namespace's url path
struct Endpoint {
    
    // MARK: - Coins & Tokens
    enum Coins {
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
    }
    
    // MARK: - Historical Charts
    enum Charts {
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
    enum Search {
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
    enum Global {
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
    enum NFTs {
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
    enum Categories {
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
    enum OnChain {
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
    enum Exchanges {
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
    enum Treasury {
        case companies(coinId: String)
        
        var path: String {
            switch self {
            case .companies(let coinId):
                return "/companies/public_treasury/\(coinId)"
            }
        }
    }
}
