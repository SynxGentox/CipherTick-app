//
//  APIError.swift
//  CipherTick app
//
//  Created by Aryan Verma on 16/04/26.
//



/// Error Collection
enum APIError: Error {
    case featureDisabled(String)
    case invalidURL
    case networkError(Int)
    case decodingError
}
