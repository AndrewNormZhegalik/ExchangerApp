//
//  Double+Extension.swift
//  Exchanger
//
//  Created by Andrey on 12.03.24.
//

import Foundation

extension Double {
    func format(f: String) -> String {
        String(format: "%\(f)f", self)
    }
}

