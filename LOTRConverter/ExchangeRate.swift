//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Bhavin Chauhan on 18/07/25.
//

import SwiftUI

struct ExchangeRate: View {
    
    @State var leftImage : ImageResource
    @State var txtTitle : String
    @State var rightImage : ImageResource

    var body: some View {
        HStack{
            
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
            
            Text(txtTitle)
                .font(.subheadline)
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
            
        }
    }
}

#Preview(body: {
    ExchangeRate(leftImage: .goldpenny, txtTitle: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpiece)
})
