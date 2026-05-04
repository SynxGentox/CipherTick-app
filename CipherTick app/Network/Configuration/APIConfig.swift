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
    let isAppWorking = true                     //Enable or Disable this to controller whether the app should work or not
                                                /// NOTE: - this app can only be stopped either from API server crash or shuddown or Manual Shutdown through this switch (be careful)
    //API key Control
    let useAPIKey = false                        //Enable to use APIKey
    let isKeyPremium = false                    //Enable this if your key is Premium ?? demoKey
    
   // UserDefaults.standard.register(defaults: [])
    let demoKeyDelay = 3.3
    let premiumKeyDelay = 0.3
    
    // FeatrudFlag - Once per endpoint namespace
    let isEnabledCoin       = true              // always on Core feeature
    let isEnabledChart      = false
    let isEnabledCategory   = false
    let isEnabledNFT        = false
    let isEnabledSearch     = false
    let isEnabledGlobal     = false
    let isEnabledOnChange   = false
    let isEnabledExchange   = false
    let isEnabledTreasury   = false
}
