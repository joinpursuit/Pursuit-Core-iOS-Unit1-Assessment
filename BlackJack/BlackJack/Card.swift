//
//  Card.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

// TODO: currently there are 5 errors in the Card struct
// 1. Follow steps from Suit.swift section in the assessment README
// 2. Follow steps from FaceCard.swift section in the assessment README

struct Card { // added Equatable to remove elements from [Card] in game file
  var suit: Suit
  var value: Int
  var isFaceCard: Bool
  var face: FaceCard?
  
  func stringify() -> String {
    var cardStr = ""
    if self.isFaceCard {
      cardStr += self.face?.rawValue ?? "🤣"
    } else {
      cardStr += self.value.description
    }
    cardStr += self.suit.rawValue
    return cardStr
  }
  
  static func newDeck(aceValue: Int) -> [Card] {
    var cards = [Card]()
    for cardValue in 2..<11 {
      for suit in Suit.allCases {
        let card = Card(suit: suit, value: cardValue, isFaceCard: false)
        cards.append(card)
      }
    }
    for face in FaceCard.allCases {
      for suit in Suit.allCases {
        let card = Card(suit: suit, value: 10, isFaceCard: true, face: face)
        cards.append(card)
      }
    }
    for suit in Suit.allCases {
      let card = Card(suit: suit, value: aceValue, isFaceCard: false)
      cards.append(card)
    }
    return cards
  }
}
