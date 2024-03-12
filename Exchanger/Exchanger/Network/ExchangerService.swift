//
//  ExchangerService.swift
//  Exchanger
//
//  Created by Andrey on 10.03.24.
//

import Combine

final class ExchangerService: ExchangerServiceProtocol {
    private let apiClient = URLSessionAPIClient<ExchangerEndpoint>()
    
    func exchange(with model: ExchangeModel) -> AnyPublisher<ExchangeModel, Error> {
        apiClient.request(.fxRates(model: model))
    }
}

