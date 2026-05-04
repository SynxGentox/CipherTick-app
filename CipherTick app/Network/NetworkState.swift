//
//  NetworkState.swift
//  CipherTick app
//
//  Created by Aryan Verma on 16/04/26.
//

//MARK: - NetworkStates
enum NetworkState: Equatable {
    case isLoading
    case isSuccess
    case isError(String)
    case isEmpty
}
