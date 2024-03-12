//
//  CurrencyViewModel.swift
//  Exchanger
//
//  Created by Andrey on 10.03.24.
//

import Foundation


struct CurrencyViewModel {
    var country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    init(from viewModel: SendingViewModel) {
        self.init(country: viewModel.country)
    }
}
