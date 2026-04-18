//
//  CryptoData.swift
//  CipherTick app
//
//  Created by Aryan Verma on 16/04/26.
//

import Foundation

struct Coin: Decodable {
    
    let id: String
    let name: String
    let symbol: String
    let image: String?
    
    let price: Double?
    let marketCap: Double?
    let volume: Double?
    let marketCapRank: Int?
    let priceChange: Double?
    let changePercent: Double?
    let high24hr: Double?
    let low24hr: Double?
    let lastUpdated: String?
    
    enum CodingKeys: String, CodingKey {
        
        case id, name, symbol, image
        
        case price = "current_price"
        case marketCap = "market_cap"
        case volume = "total_volume"
        case marketCapRank = "market_cap_rank"
        case priceChange = "price_change_24h"
        case changePercent = "price_change_percentage_24h"
        case high24hr = "high_24h"
        case low24hr = "low_24h"
        case lastUpdated = "last_updated"
    }
}
