//
//  ExchangerViewModel.swift
//  Exchanger
//
//  Created by Andrey on 10.03.24.
//

import Foundation
import Combine
import SwiftUI

class ExchangerViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    let exchangerService: ExchangerServiceProtocol
    
    @Published private var exchangeModel: ExchangeModel = ExchangeModel(from: Country.PLN.rawValue, to: Country.UAH.rawValue, fromAmount: 300.0)
    
    var from: String {
        get {
            exchangeModel.from
        } 
        set {
            exchangeModel.from = newValue
        }
    }
    
    var to: String {
        get {
            exchangeModel.to
        }
        set {
            exchangeModel.to = newValue
        }
    }
    
    var rate: Double {
        exchangeModel.rate
    }
    
    var formattedRate: String {
        exchangeModel.rate.format(f: ".2")
    }
    
    var fromAmount: Double {
        get {
            exchangeModel.fromAmount
        }
        set {
            guard newValue <= limitAmount else { return }
            exchangeModel.fromAmount = newValue
        }
    }
    
    var toAmount: Double {
        exchangeModel.toAmount
    }
    
    var formattedToAmount: String {
        exchangeModel.toAmount.format(f: ".2")
    }
    
    var formattedFromAmount: String {
        exchangeModel.fromAmount.format(f: ".2")
    }
    
    var limitAmount: Double {
        exchangeModel.limitAmount ?? 5000
    }
    
    var rateText: String {
        "1 \(from) = \(formattedRate) \(to)"
    }
    
    init(exchangerService: ExchangerServiceProtocol) {
        self.exchangerService = exchangerService
    }
    
    func exchange() {
        exchangerService.exchange(with: exchangeModel)
            .receive(on: DispatchQueue.main)
            .sink { data  in
                //
            } receiveValue: { [weak self] data in
                guard let self else { return }
                self.exchangeModel = data
                self.exchangeModel.limitAmount = Country(rawValue: self.exchangeModel.from)?.maxAmount
            }.store(in: &cancellables)
    }
    
    func swap() {
        exchangeModel = ExchangeModel(from: exchangeModel.to, to: exchangeModel.from, fromAmount: exchangeModel.fromAmount)
        exchange()
    }
    
    func isValid(_ amount: Double?) -> Bool {
        guard let inputAmount = amount else { return true }
        return inputAmount <= limitAmount
    }
    
    func getCurrencyImageName(_ isReciever: Bool) -> String {
        isReciever ? Country(rawValue: to)?.imageName ?? "" : Country(rawValue: from)?.imageName ?? ""
    }
}

extension ExchangerViewModel {
    func validationStrokeWidth(for amount: String) -> CGFloat {
        isValid(Double(amount)) ? 0 : 2
    }
    
    func validateStrokeColor(for amount: String) -> Color {
        isValid(Double(amount)) ? .white : ColorManager.lightPink
    }
}

extension ExchangerViewModel {
    func getSearchedResults(_ searchText: String) -> [Country] {
        let countries = Country.allCases
        
        if searchText.isEmpty {
            return countries
        } else {
            let lowercasedSearchText = searchText.lowercased()
            return countries.filter { country in
                country.longCurrency.localizedCaseInsensitiveContains(lowercasedSearchText) || country.rawValue.localizedCaseInsensitiveContains(lowercasedSearchText) || country.imageName.localizedCaseInsensitiveContains(lowercasedSearchText)
            }
        }
    }
    
    func updateSelectedCountry(_ country: Country, _ isReciever: Bool) {
        if isReciever {
            to = country.rawValue
        } else {
            from = country.rawValue
        }
        exchange()
    }
}
