//
//  ItemRow.swift
//  Exchanger
//
//  Created by Andrey on 11.03.24.
//

import SwiftUI

struct ItemRow: View {
    private let country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image(country.imageName)
                    .padding(10)
                    .background(
                        Circle()
                            .fill(ColorManager.customWhite)
                    )
                VStack(alignment: .leading, spacing: 6) {
                    Text(country.imageName.capitalized)
                        .font(.system(size: 14, weight: .bold))
                    Text("\(country.longCurrency) \u{2022} \(country.rawValue)")
                        .foregroundStyle(ColorManager.lightGrayNew)
                        .font(.system(size: 14, weight: .regular))
                }
                Spacer()
            }
            .background(.clear)
            Divider()
                .frame(height: 1)
        }
        .background(.clear)
        
    }
}

#Preview {
    ItemRow(country: Country.EUR)
}
