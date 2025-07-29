//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Bhavin Chauhan on 18/07/25.
//

import SwiftUI

struct IconGrid: View {

    @Binding var currency : Currency

    var body: some View {

                LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]) {
                    ForEach(Currency.allCases){ currency in
                        
                        if self.currency == currency{
                            CurrencyIcon(currencyName: currency.name, currencyIcon: currency.image)
                                .shadow(color:.black, radius: 10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(lineWidth: 0.5)
                                }
                        }else{
                            CurrencyIcon(currencyName: currency.name, currencyIcon: currency.image)
                                .onTapGesture {
                                    self.currency = currency
                                    print("Icon Grid Currency: \(self.currency)")
                                }
                        }
                        
                    }
                }
                
               
    }
}

#Preview {
    @Previewable @State var currency : Currency = .silverPiece
    IconGrid(currency: $currency)
}
