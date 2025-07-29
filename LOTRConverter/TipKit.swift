//
//  TipKit.swift
//  LOTRConverter
//
//  Created by Bhavin Chauhan on 29/07/25.
//

import Foundation
import TipKit

struct CurrencyTip : Tip{
    
    var title = Text("Change Currency")
    
    var message : Text? = Text("You can tap left or right currency to bring up the Select Currency screen.")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
    
}
