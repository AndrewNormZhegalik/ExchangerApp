//
//  UserEndpoint.swift
//  Exchanger
//
//  Created by Andrey on 10.03.24.
//

import Foundation

enum ExchangerEndpoint: ApiEndpoint {
    case fxRates(model: ExchangeModel)
    
    var baseURL: URL {
        return URL(string: "https://my.transfergo.com/api")!
    }
    
    var path: String {
        switch self {
        case .fxRates:
            return "/fx-rates"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fxRates:
            return .get
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .fxRates(model: let model):
            return ["from": model.from, "to": model.to, "amount": model.fromAmount]
        }
    }
}
