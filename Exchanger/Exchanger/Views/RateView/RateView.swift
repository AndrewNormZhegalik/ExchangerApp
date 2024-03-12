//
//  RateView.swift
//  Exchanger
//
//  Created by Andrey on 10.03.24.
//

import SwiftUI

struct RateView: View {
    @ObservedObject var viewModel = ExchangerViewModel(exchangerService: ExchangerService())
    
    var body: some View {
        Text(viewModel.rateText)
            .foregroundStyle(.white)
            .font(.system(size: 10, weight: .bold))
            .padding(.horizontal, 8)
            .padding(.vertical, 2)
            .background(.black)
    }
}

#Preview {
    RateView(viewModel: ExchangerViewModel(exchangerService: ExchangerService()))
}
