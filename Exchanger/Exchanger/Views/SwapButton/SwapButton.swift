//
//  SwapButton.swift
//  Exchanger
//
//  Created by Andrey on 11.03.24.
//

import SwiftUI

struct SwapButton: View {
    @StateObject var viewModel: ExchangerViewModel
    
    var body: some View {
        Button(action: {
            viewModel.swap()
        }, label: {
            Image(Constants.Images.reverse)
        })
        .frame(minWidth: 24, minHeight: 24)
    }
}

#Preview {
    SwapButton(viewModel: ExchangerViewModel(exchangerService: ExchangerService()))
}
