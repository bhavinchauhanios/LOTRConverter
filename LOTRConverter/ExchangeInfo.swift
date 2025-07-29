//
//  ExchangeInfo.swift
//  LOTRConverter
//
//  Created by Bhavin Chauhan on 18/07/25.
//

import SwiftUI

struct ExchangeInfo: View {

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack(alignment: .center){
            // Fullscreen background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            // Only background image ignores safe area
            
//                    Color(.brown) // 👈 Background color (behind everything)
//                    .ignoresSafeArea() // Ensure it covers full screen

            // VStack constrained to Safe Area
            VStack(alignment: .center, spacing: 25) {
                
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)

                Text("""
                Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one.We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us.Below is a simple guide to our currency exchange rates:
                """)
                .font(.title3)
                .padding()

                VStack{
                        
                    ExchangeRate(leftImage: .goldpenny, txtTitle: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpiece)
                    ExchangeRate(leftImage: .silverpenny, txtTitle: "2 Gold Piece = 8 Gold Pennies", rightImage: .silverpiece)
                    ExchangeRate(leftImage: .copperpenny, txtTitle: "3 Gold Piece = 12 Gold Pennies", rightImage: .copperpenny)
                    ExchangeRate(leftImage: .goldpenny, txtTitle: "4 Gold Piece = 16 Gold Pennies", rightImage: .goldpiece)
                   
                }
                
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
                
                
            }
            .foregroundStyle(.black)
            .padding(20)
            
         
        }


    }
}

#Preview {
    ExchangeInfo()
}

