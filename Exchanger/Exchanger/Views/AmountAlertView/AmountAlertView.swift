//
//  AlertView.swift
//  Exchanger
//
//  Created by Andrey on 11.03.24.
//

import SwiftUI

struct AmountAlertView: View {
    let amount: Int
    let country: String
    @Binding var show: Bool

    var body: some View {
        HStack {
            Image(Constants.Images.info)
            Text("\(Constants.maxAmount): \(amount) \(country)")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(ColorManager.lightPinkSecond)
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(ColorManager.lightPinkSecond.opacity(0.16))
        )
        .transition(.move(edge: .top).combined(with: .opacity))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.show = false
                }
            }
        }
    }
}

struct AmountAlertModifier: ViewModifier {
    @Binding var show: Bool
    
    let toastView: AmountAlertView
    
    func body(content: Content) -> some View {
        VStack {
            if show {
                toastView
            }
            content
        }
    }
}

extension View {
    func toast(toastView: AmountAlertView, show: Binding<Bool>) -> some View {
        self.modifier(AmountAlertModifier(show: show, toastView: toastView))
    }
}

#Preview {
    AmountAlertView(amount: 20000, country: "UAH", show: .constant(false))
}
