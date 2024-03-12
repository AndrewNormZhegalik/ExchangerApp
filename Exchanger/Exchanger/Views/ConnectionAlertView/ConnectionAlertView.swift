//
//  NetworkConnectionAlert.swift
//  Exchanger
//
//  Created by Andrey on 11.03.24.
//

import SwiftUI

struct ConnectionAlertView: View {
    @Binding var show: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            Image(Constants.Images.xPink)
            VStack(alignment: .leading) {
                Text(Constants.noNetwork)
                    .foregroundStyle(ColorManager.darkBlue)
                    .font(.system(size: 16, weight: .bold))
                Text(Constants.checkInternet)
                    .foregroundStyle(ColorManager.lightGrayNew)
            }
            Button(action: {
                withAnimation {
                    self.show = false 
                }
            }, label: {
                Image(Constants.Images.xGray)
            })
            .padding(.bottom, 23)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
                .shadow(color:
                            ColorManager.darkBlue.opacity(0.16), radius: 10)
        )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.show = false
                }
            }
        }
    }
}

struct ConnectionAlertModifier: ViewModifier {
    @Binding var show: Bool
    
    let connectionAlert: ConnectionAlertView
    
    func body(content: Content) -> some View {
        ZStack {
            content
            HStack(alignment: .top) {
                if show {
                    connectionAlert
                }
            }
        }
    }
}

extension View {
    func connectionToast(toastView: ConnectionAlertView, show: Binding<Bool>) -> some View {
        modifier(ConnectionAlertModifier(show: show, connectionAlert: toastView))
    }
}

#Preview {
    ConnectionAlertView(show: .constant(true))
}
