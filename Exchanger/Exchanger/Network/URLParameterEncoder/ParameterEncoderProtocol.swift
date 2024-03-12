//
//  ParameterEncoderProtocol.swift
//  Exchanger
//
//  Created by Andrey on 10.03.24.
//

import Foundation

protocol ParameterEncoderProtocol {
    static func encode(urlRequest: inout URLRequest, with parameters: URLParameters)
}
