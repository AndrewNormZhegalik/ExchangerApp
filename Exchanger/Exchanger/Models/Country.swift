//
//  Country.swift
//  Exchanger
//
//  Created by Andrey on 10.03.24.
//

import Foundation

enum Country: String, Identifiable, CaseIterable {
    var id: Self {
        return self
    }
    
    case PLN
    case EUR
    case GBP
    case UAH
    
    var imageName: String {
        switch self {
        case .PLN:
            return "poland"
        case .EUR:
            return "germany"
        case .GBP:
            return "greatBritain"
        case .UAH:
            return "ukraine"
        }
    }
    
    var name: String {
        switch self {
        case .PLN:
            return "poland"
        case .EUR:
            return "germany"
        case .GBP:
            return "great britain"
        case .UAH:
            return "ukraine"
        }
    }
    
    var longCurrency: String {
        switch self {
        case .PLN:
            return "Polish zloty"
        case .EUR:
            return "Euro"
        case .GBP:
            return "British Pound"
        case .UAH:
            return "Hrivna"
        }
    }
    
    var maxAmount: Double {
        switch self {
        case .PLN:
            return 20000
        case .EUR:
            return 5000
        case .GBP:
            return 1000
        case .UAH:
            return 50000
        }
    }
}
