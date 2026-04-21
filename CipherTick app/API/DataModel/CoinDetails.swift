//
//  CoinDetails.swift
//  CipherTick app
//
//  Created by Aryan Verma on 21/04/26.
//

struct CoinDetails: Decodable {
    let id: String
    let name: String
    let symbol: String
    let category: [String]
    
    let blockTime: Int?
    let description: Description                                // description
    let links: Link                                             // links
    let image: Image                                            // image
    let marketData: MarketData
    
    
    enum CodingKeys: String, CodingKey {
        case image, links, description, id, name, symbol
        case category = "categories"
        case blockTime = "block_time_in_minutes"
        case marketData = "market_data"
    }
    
    struct Description: Decodable {
        let en: String?
        enum CodingKeys: String, CodingKey {
            case en
        }
    }
    struct Link: Decodable {
        let homepage: [String]?
        enum CodingKeys: String, CodingKey {
            case homepage
        }
    }
    struct Image: Decodable {
        let large: String
        enum CodingKeys: String, CodingKey {
            case large
        }
    }
    
    struct MarketData: Decodable, Hashable {
        let price: [String: Double]                             //current price
        let aTHighest: [String: Double]?                        //all time highest in currency
        let aTHighestPercent: [String: Double]?                 //all time highest %
        let aTLowest: [String: Double]?                         //all time lowest in currency
        let aTLowestPercent: [String: Double]?                  //all time lowest %
        let marketCap: [String: Double]?                        //market cap
        let marketCapRank: Int?                                 //market cap rank
        let totalVolume: [String: Double]?                      //total_volume
        let highestPerDay: [String:Double]?                     //highest price in 24h in currency
        let lowestPerDay: [String: Double]?                     //lowest price in 24h in currency
        let priceChangePercentPerDay: [String: Double]?                   //price % change in 24h
        let capChangePercentPerDay: [String: Double]?           //market cap % change in 24h
        
        enum CodingKeys: String, CodingKey {
            case price = "current_price"
            case aTHighest = "ath"
            case aTHighestPercent = "ath_change_percentage"
            case aTLowestPercent = "atl_change_percentage"
            case aTLowest = "atl"
            case lowestPerDay = "low_24h"
            case highestPerDay = "high_24h"
            case totalVolume = "total_volume"
            case marketCapRank = "market_cap_rank"
            case marketCap = "market_cap"
            case priceChangePercentPerDay = "price_change_percentage_24h_in_currency"
            case capChangePercentPerDay = "market_cap_change_percentage_24h_in_currency"
        }
    }
}
