//
//  ContentView.swift
//  Exchanger
//
//  Created by Andrey on 10.03.24.
//

import SwiftUI
import Combine

extension CGFloat: ShapeStyle {}

struct MainView: View {
    @EnvironmentObject private var networkMonitor: NetworkMonitor
    @State private var showAmountAlert: Bool = false
    @State private var showInternetAlert: Bool = false
    @State private var inputAmount: String = ""
    @StateObject private var viewModel = ExchangerViewModel(exchangerService: ExchangerService())
    
    var body: some View {
        VStack {
            ZStack {
                VStack(spacing: 0) {
                    SendingView(viewModel: viewModel, inputAmount: $inputAmount)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: ColorManager.darkBlue.opacity(0.16), radius: 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(viewModel.validateStrokeColor(for: inputAmount), lineWidth: viewModel.validationStrokeWidth(for: inputAmount))
                        )
                    
                    SendingView(viewModel: viewModel, inputAmount: $inputAmount, isReciever: true)
                }
                
                RateView(viewModel: viewModel)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                HStack {
                    SwapButton(viewModel: viewModel)
                        .padding(.leading, 40)
                    Spacer()
                }
            }
            .background(ColorManager.customWhite.clipShape(RoundedRectangle(cornerRadius: 16)))
            .padding(.horizontal, 20)
            .padding(.top, 40)
            VStack {
                Spacer()
            }
            .toast(toastView: AmountAlertView(amount: Int(viewModel.limitAmount), country: viewModel.from, show: $showAmountAlert), show: $showAmountAlert)
        }
        .connectionToast(toastView: ConnectionAlertView(show: $showInternetAlert), show: $showInternetAlert)
        .onAppear {
            viewModel.exchange()
        }
        .onChange(of: networkMonitor.isConnected) { _, connection in
            showInternetAlert = !connection
        }
        .onChange(of: inputAmount) {
            showAmountAlert = !viewModel.isValid(Double(inputAmount))
            if let amount = Double(inputAmount), !showAmountAlert {
                viewModel.fromAmount = amount
                viewModel.exchange()
            }
        }
        .background(.white)
    }
}

#Preview {
    MainView()
}
