//
//  ExchangerServiceProtocol.swift
//  Exchanger
//
//  Created by Andrey on 10.03.24.
//

import Combine

protocol ExchangerServiceProtocol {
    func exchange(with model: ExchangeModel) -> AnyPublisher<ExchangeModel, Error>
}
