//
//  SearchBarView.swift
//  Exchanger
//
//  Created by Andrey on 11.03.24.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                Image(Constants.Images.searchGlass)
                TextField("", text: $searchText)
                    .foregroundStyle(ColorManager.secondGrayColor)
                    .overlay(
                        Image(systemName: Constants.Images.xMarkCircle)
                            .padding()
                            .offset(x: 10)
                            .foregroundStyle(ColorManager.secondGrayColor)
                            .opacity(searchText.isEmpty ? 0.0 : 1.0)
                            .onTapGesture {
                                searchText = ""
                            }
                        , alignment: .trailing
                    )
            }
            .font(.headline)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.white)
                    .stroke(ColorManager.secondGrayColor, lineWidth: 1)
            )
            ZStack {
                Text(Constants.search)
                    .padding([.horizontal, .vertical], 6)
                    .foregroundStyle(ColorManager.secondGrayColor)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.white)
                    )
            }
            .padding(.leading, 16)
            .padding(.bottom, 58)
        }
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
