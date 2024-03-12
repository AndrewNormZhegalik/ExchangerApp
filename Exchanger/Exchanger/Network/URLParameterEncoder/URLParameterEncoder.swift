//
//  Parameterencoder.swift
//  Exchanger
//
//  Created by Andrey on 10.03.24.
//

import Foundation

struct URLParameterEncoder: ParameterEncoderProtocol {
    static func encode(urlRequest: inout URLRequest, with parameters: URLParameters) {
        guard let url = urlRequest.url else { return }
        
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            
            urlRequest.url = urlComponents.url
        }
    }
}
