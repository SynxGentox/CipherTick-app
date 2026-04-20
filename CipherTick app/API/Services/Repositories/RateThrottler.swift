//
//  RateThrottler.swift
//  CipherTick app
//
//  Created by Aryan Verma on 20/04/26.
//

import Foundation

actor RateThrottler {
    private var lastRequestTime: Date?
    private var interval: TimeInterval
    
    init (interval: TimeInterval = 4) {
        self.interval = interval
    }
    
    func canProceed() -> Bool {
        guard let last = lastRequestTime else {
            lastRequestTime = .now
            return true
        }
        if Date.now.timeIntervalSince(last) >= interval {
            lastRequestTime = .now
            return true
        }
        return false
    }
}
