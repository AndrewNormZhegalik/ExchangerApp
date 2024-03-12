//
//  URLSessionAPIClient.swift
//  Exchanger
//
//  Created by Andrey on 10.03.24.
//

import Foundation
import Combine

class URLSessionAPIClient<EndpointType: ApiEndpoint>: ApiClient {
    func request<T>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> where T : Decodable {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
    
        endpoint.headers?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        if let parameters = endpoint.parameters {
            URLParameterEncoder.encode(urlRequest: &request, with: parameters)
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    throw ApiError.invalidResponse
                }
//                do {
//                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                        print(json)
//                    }
//                } catch let error as NSError {
//                    print("Failed to load: \(error.localizedDescription)")
//                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

