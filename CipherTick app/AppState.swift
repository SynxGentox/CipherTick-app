//
//  AppState.swift
//  CipherTick app
//
//  Created by Aryan Verma on 16/04/26.
//

import Foundation

enum AppState {
    case isLoading
    case isSuccess
    case isError(Error, () -> Void)
    case isEmpty(() -> Void)
}
