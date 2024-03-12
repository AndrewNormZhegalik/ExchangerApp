//
//  SearchingView.swift
//  Exchanger
//
//  Created by Andrey on 11.03.24.
//

import SwiftUI

struct SearchingView: View {
    @Environment(\.dismiss) private var dismiss
    
    let isReciever: Bool
    @State private var searchText: String = ""
    @ObservedObject var viewModel: ExchangerViewModel
    
    var searchResults: [Country] {
        viewModel.getSearchedResults(searchText)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text(isReciever ? Constants.sendingTo : Constants.sendingFrom)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.black)
                .padding(.top, 15)
            
            SearchBarView(searchText: $searchText)
                .padding(.horizontal, 16)
            
            HStack {
                Text(Constants.allCountries)
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 18)
            
            List(searchResults, id: \.self) { country in
                ItemRow(country: country)
                    .background(.clear)
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        viewModel.updateSelectedCountry(country, isReciever)
                        dismiss()
                    }
                    .listRowSeparator(.hidden)
            }
            .frame(maxWidth: .infinity)
            .ignoresSafeArea(.all)
            .listStyle(PlainListStyle())
            .scrollContentBackground(.hidden)
            .environment(\.defaultMinListRowHeight, 75)
        }
    }
}

#Preview {
    SearchingView(isReciever: true, viewModel: ExchangerViewModel(exchangerService: ExchangerService()))
}
