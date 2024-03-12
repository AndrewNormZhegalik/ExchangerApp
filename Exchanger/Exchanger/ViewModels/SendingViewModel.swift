//
//  SendingViewModel.swift
//  Exchanger
//
//  Created by Andrey on 10.03.24.
//

import Combine


public class SendingViewModel: ObservableObject {
    var country: Country
    
    init(country: Country) {
        self.country = country
    }
}
