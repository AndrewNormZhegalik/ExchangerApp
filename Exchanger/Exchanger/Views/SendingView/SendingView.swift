//
//  SendingView.swift
//  Exchanger
//
//  Created by Andrey on 10.03.24.
//

import SwiftUI
import Combine

struct SendingView: View {
    @State private var isShowingSheet = false
    @ObservedObject var viewModel: ExchangerViewModel
    @Binding var inputAmount: String
    @State var isReciever: Bool = false
    
    @State private var isEditing: Bool = false
    
    var body: some View {
        HStack {
            VStack {
                Text(isReciever ? Constants.receiverGets : Constants.sendingFrom)
                    .foregroundStyle(ColorManager.lightGrayNew)
                    .font(.system(size: 14, weight: .regular))
                CurrencyView(viewModel: viewModel, isReciever: isReciever)
                    .onTapGesture {
                        isShowingSheet.toggle()
                    }
            }
            
            Spacer()
            
            if isReciever {
                Text(viewModel.formattedToAmount)
                    .foregroundStyle(.black)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.trailing)
            } else {
                TextField(viewModel.formattedFromAmount, text: $inputAmount, onEditingChanged: { isBegin in
                    isEditing = isBegin
                })
                .keyboardType(.numberPad)
                .foregroundStyle(Double(inputAmount) ?? 0 < viewModel.limitAmount ? ColorManager.lightBlue : ColorManager.lightPink)
                .autocorrectionDisabled()
                .font(.system(size: 32, weight: .bold))
                .multilineTextAlignment(.trailing)
            }
            
        }
        .padding(12)
        .sheet(isPresented: $isShowingSheet) {
            SearchingView(isReciever: isReciever, viewModel: viewModel)
        }
    }
}

#Preview {
    SendingView(viewModel: ExchangerViewModel(exchangerService: ExchangerService()), inputAmount: .constant(""))
}
