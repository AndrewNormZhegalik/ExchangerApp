//
//  ApiEndpoint.swift
//  Exchanger
//
//  Created by Andrey on 10.03.24.
//

import Foundation

typealias URLParameters = [String : Any]

protocol ApiEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: URLParameters? { get }
}
