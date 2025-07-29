//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Bhavin Chauhan on 18/07/25.
//

import SwiftUI

struct SelectCurrency: View {

    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency : Currency
    @Binding var bottomCurrency : Currency

    var body: some View {

        ZStack(){

            // Fullscreen background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
                
            VStack{
                
                //Top Text
                Text("Select the currency you are starting with:")
                .fontWeight(.bold)
                IconGrid(currency: $topCurrency)
                
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)
                IconGrid(currency: $bottomCurrency)
                
                Button{
                    dismiss()
                }label: {
                    Text("Done")
                }
                
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                
            }.padding()
                .multilineTextAlignment(.center)
                .foregroundStyle(.black)
               
        }
        
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .silverPenny
    @Previewable @State var bottomCurrency: Currency = .goldPenny
    SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}
