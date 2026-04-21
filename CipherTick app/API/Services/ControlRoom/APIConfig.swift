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
    
    //APP Controller
    var isAppWorking = true                     //Enable or Disable this to controller whether the app should work or not
                                                /// NOTE: - this app can only be stopped either from API server crash or shuddown or Manual Shutdown through this switch (be careful)
    
    //API key Control
    var useAPIKey = true                       //Enable to use APIKey
    var isKeyPremium = false                    //Enable this if your key is Premium ?? demoKey
    
    var demoKeyDelay = 3.3
    var premiumKeyDelay = 0.3
    
    // FeatrudFlag - Once per endpoint namespace
    var isEnabledCoin       = true              // always on Core feeature
    var isEnabledChart      = false
    var isEnabledCategory   = false
    var isEnabledNFT        = false
    var isEnabledSearch     = false
    var isEnabledGlobal     = false
    var isEnabledOnChange   = false
    var isEnabledExchange   = false
    var isEnabledTreasury   = false
}
