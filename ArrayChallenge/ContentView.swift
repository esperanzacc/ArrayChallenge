//
//  ContentView.swift
//  ArrayChallenge
//
//  Created by Esperanza on 2022-09-18.
//

import SwiftUI

struct Card {
  @State var trackNumber: Int = Int.random(in: 1...13)
  @State var trackSuit: String = ["Spades", "Clubs", "Hearts", "Diamonds"].randomElement()!
}


struct ContentView: View {
  // Store instances of the structure
  @State var deck = [Card]()
  // it will show message depends on what we generate a card
  @State var message: String = ""
  // store every card we generate and check it has already existed or not
  @State var cardArr: [String] = []
  
  var body: some View {
    VStack {
      Text(message)
      Button {
        generateCard()
        
      } label: {
        Text("Generate a card!")
          .padding()
          .font(.headline)
          .foregroundColor(.white)
          .background(Color.teal)
          .cornerRadius(10)
      }
      Button {
        selectCard()
      } label: {
        Text("Randomly selected a card")
          .padding()
          .font(.subheadline)
          .bold()
          .foregroundColor(.white)
          .background(Color.yellow)
          .cornerRadius(10)
      }
    }
    .padding()
  }
  
  func generateCard() {
    // create one card object
    let card = Card()
    var newCard: String = ""
    newCard = String(card.trackNumber) + card.trackSuit
    
    if cardArr.contains(newCard) {
      message = "Generated duplicate card"
    } else {
      // Add value to cardArr
      switch card.trackNumber {
      case 1:
        message = "Generated a Ace of \(card.trackSuit)."
      case 11:
        message = "Generated a Jack of \(card.trackSuit)."
      case 12:
        message = "Generated a Queen of \(card.trackSuit)."
      case 13:
        message = "Generated a King of \(card.trackSuit)."
      default:
        message = "Generated a \(card.trackNumber) of \(card.trackSuit)."
      }
      cardArr.append(newCard)
      print(newCard)
      print(cardArr)
      deck.append(card)
    }
  }
  
  func selectCard() {
    // check deck whether is Empty or not
    if deck.isEmpty {
      message = "No cards in the deck"
    } else {
      // pick up one randomly
      let getCard = deck[Int.random(in: 0...deck.count - 1)]
      
      switch getCard.trackNumber {
      case 1:
        message = "Drew a Ace of \(getCard.trackSuit)"
      case 11:
        message = "Drew a Jack of \(getCard.trackSuit)"
      case 12:
        message = "Drew a Queen of \(getCard.trackSuit)"
      case 13:
        message = "Drew a King of \(getCard.trackSuit)"
      default:
        message = "Drew a \(getCard.trackNumber) of \(getCard.trackSuit)"
      }
    }
  }
    
}
    

struct ContentView_Previews: PreviewProvider {
  
    static var previews: some View {
        ContentView()
    }
}
