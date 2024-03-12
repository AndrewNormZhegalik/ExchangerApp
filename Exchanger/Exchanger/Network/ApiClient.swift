//
//  ApiClient.swift
//  Exchanger
//
//  Created by Andrey on 10.03.24.
//

import Combine

protocol ApiClient {
    associatedtype EndpointType: ApiEndpoint
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}
