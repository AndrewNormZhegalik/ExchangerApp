//
//  ExchangeModel.swift
//  Exchanger
//
//  Created by Andrey on 10.03.24.
//

import Foundation

struct ExchangeModel: Decodable {
    var from: String
    var to: String
    let rate: Double
    var fromAmount: Double
    var toAmount: Double
    var limitAmount: Double?
    
    init(from: String, to: String, fromAmount: Double, toAmount: Double = 0.0, rate: Double = 0.0) {
        self.from = from
        self.to = to
        self.rate = rate
        self.fromAmount = fromAmount
        self.toAmount = toAmount
    }
    
    init() {
        from = ""
        to = ""
        rate = 0
        fromAmount = 0
        toAmount = 0
    }
}
