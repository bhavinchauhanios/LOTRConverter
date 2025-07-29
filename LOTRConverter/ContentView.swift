//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Bhavin Chauhan on 16/07/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    @State private var showExhangeInfo = false
    @State var showSelectCurrency = false
    
    @State private var leftAmount = ""
    @State private var rightAmount = ""
    
    @State var leftCurrency : Currency = Currency.silverPiece
    @State var rightCurrency : Currency = .goldPiece
    
    let currencyTip = CurrencyTip()
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    @FocusState private var isFocused: Bool

    var body: some View {
        ZStack{
            
            //Background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                //Prancing pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    
                //Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                //Conversion section
                HStack{
                    //Left conversion section
                    VStack{
                        //Currency
                        
                        HStack{
                            //Currency image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //Currency text
                            Text(leftCurrency.name)
                                .foregroundStyle(.white)
                                .font(.headline)
                        }
                        
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(currencyTip,arrowEdge: .bottom)
                        
                        //Text Field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.leading)
                            .keyboardType(.decimalPad)
                            .padding(.bottom, -5)
                            .focused($leftTyping)
                            .onChange(of: leftAmount){
                                if leftTyping{
                                    rightAmount = leftCurrency.convert(leftAmount,to: rightCurrency)
                                }
                            }
                    }

                    
                    //Equal Sign
                    Image(systemName: "equal")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .symbolEffect(.pulse)
                    
                    //Right conversion secion
                    VStack{
                        //Currency
                        
                        HStack{
                            //Currency text
                            Text(rightCurrency.name)
                                .foregroundStyle(.white)
                                .font(.headline)
                            
                            //Currency image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        
                        //Text Field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .padding(.bottom, -5)
                            .focused($rightTyping)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightAmount) { oldValue, newValue in
                                if rightTyping{
                                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                            }
                        }
                        
                    }

                }.padding()
                    .background(.black.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(20)

                Spacer()
                //Info button
                
                HStack {
                    Spacer()
                    Button{
                        UIApplication.shared.endEditing()
                        showExhangeInfo.toggle()
                    }label: {
                        NavigationLink("View Exchange Rates", destination: ExchangeInfo())

                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }.padding(.trailing)
                 
                }
                  
            }

            .task {
                try? Tips.configure()
            }
            
            .onChange(of: leftCurrency){
                leftAmount = rightCurrency.convert(leftAmount, to: leftCurrency)
            }
            .onChange(of: rightCurrency){
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
            .sheet(isPresented: $showExhangeInfo) {
                ExchangeInfo()
            }
            .sheet(isPresented: $showSelectCurrency) {
                SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
            }
            
            
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
        }

    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    ContentView()
}
