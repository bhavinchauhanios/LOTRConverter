//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Bhavin Chauhan on 18/07/25.
//

import SwiftUI

struct CurrencyIcon: View {

    var currencyName : String
    var currencyIcon : ImageResource
    
    var body: some View {

                //Content Thumnail
                ZStack(alignment: .bottom){
                  
                    Image(currencyIcon)
                        .resizable()
                        .scaledToFit()
                    
                    Text(currencyName)
                        .padding(3)
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                        .background(.brown.opacity(0.7))
                       
                }.padding(3)
                .frame(width: 100, height: 100)
                .background(.brown)
                .clipShape(.rect(cornerRadius: 25))
            
                                
        }
        
}

#Preview {
    CurrencyIcon(currencyName: "", currencyIcon: .copperpenny)
}
