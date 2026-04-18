//
//  API-Config.swift
//  CipherTick app
//
//  Created by Aryan Verma on 15/04/26.
//

import Foundation

/// API Control Panel - Control API services
final class APIConfig {
    
    static let shared = APIConfig()
    
    private init() {}
    
    //API key Control
    var useAPIKey = false       //Enable to use APIKey
    var isPremium = false       //Enable this if your key is Premium ?? demoKey
    
    // FeatrudFlag - Once per endpoint namespace
    var isEnabledCoin       = true            // always on Core feeature
    var isEnabledChart      = false
    var isEnabledCategory   = false
    var isEnabledNFT        = false
    var isEnabledSearch     = false
    var isEnabledGlobal     = false
    var isEnabledOnChange   = false
    var isEnabledExchange   = false
    var isEnabledTreasury   = false
}
