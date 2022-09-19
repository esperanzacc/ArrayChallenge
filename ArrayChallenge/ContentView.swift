//
//  ContentView.swift
//  ArrayChallenge
//
//  Created by Esperanza on 2022-09-18.
//

import SwiftUI

struct Card {
  @State var trackNumber: Int = Int.random(in: 1...13)
  @State var trackSuit = ["Spades", "Clubs", "Hearts", "Diamonds"].randomElement()
}


struct ContentView: View {
  @State var deck = [Card]()
  @State var label: String = "Create an instance"
    var body: some View {
        VStack {
            Text("Generated a duplicate card.")
          Button {
            let card1 = Card()
            switch card1.trackNumber {
            case 1:
              label = "Generated a Ace of \(card1.trackSuit[0])."
            case 11:
              label = "Generated a Jack of \(card1.trackSuit[1])."
            case 12:
              label = "Generated a Queen of \(card1.trackSuit[2])."
            case 13:
              label = "Generated a King of \(card1.trackSuit[3])."
            default:
              label = "\(card1.trackNumber)"
              return
            }
            
          } label: {
            Text(label)
          }
          Button {
            <#code#>
          } label: {
            <#code#>
          }

          
          }
        .padding()
        }
        
    
}

struct ContentView_Previews: PreviewProvider {
  
    static var previews: some View {
        ContentView()
    }
}
