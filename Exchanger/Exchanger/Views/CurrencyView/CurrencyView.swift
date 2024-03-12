//
//  CurrencyView.swift
//  Exchanger
//
//  Created by Andrey on 10.03.24.
//

import SwiftUI

struct CurrencyView: View {
    @ObservedObject var viewModel: ExchangerViewModel = ExchangerViewModel(exchangerService: ExchangerService())
    @State var isReciever: Bool = false
    
    var body: some View {
        HStack(alignment: .center) {
            Image(viewModel.getCurrencyImageName(isReciever))
                .frame(width: 32, height: 32)
            Text(isReciever ? viewModel.to : viewModel.from)
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(.black)
            Image(Constants.Images.chevron)
                .frame(width: 16, height: 16)
        }
    }
}

#Preview(traits: .fixedLayout(width: 100, height: 50)){
    CurrencyView(viewModel: ExchangerViewModel(exchangerService: ExchangerService()))
}
