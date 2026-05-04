//
//  URLConstructor.swift
//  CipherTick app
//
//  Created by Aryan Verma on 16/04/26.
//

import Foundation

/// URL manufacturer
final class URLConstructor {
    static let shared = URLConstructor()
    
    private init() {}
    
    /// holds the bases url either	
    private var baseURL: String {
        guard APIConfig.shared.useAPIKey && APIConfig.shared.isKeyPremium else {
            return UrlFor.demo.rawValue
        }
        return UrlFor.premium.rawValue
    }
    
    //URl-Constructor
    private func build(_ path: String) throws -> URL {
        guard APIConfig.shared.isAppWorking else {
            throw APIError.featureDisabled("App")
        }
        let completeURL = baseURL + path
        
        guard let url = URL(string: completeURL) else {
            throw URLError(.badURL)
        }
        return url
    }
    
    func build(for endpoint: EndpointType) throws -> URL {
        guard let error = endpoint.isFeatureDisableError else {
            return try build(endpoint.path)
        }
        throw error
    }
}
