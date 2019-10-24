//
//  Game.swift
//  BlackJack
//
//  Created by Yuliia Engman on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {
    var deck = [Card]()
    let player = Player(score: <#T##Int#>, cards: <#T##[Card]#>, playerName: <#T##String#>)
    var hitPlayer = Bool()
    
    var hasMoreCards: Bool {
        get {
            return !deck.isEmpty // check if I want if true or false
        }
    }
    var randomComputerScore: Int {
        get {
            return Int(18 + arc4random_uniform(21 - 18 + 1))
        }
    }
    
    func newGame() {
        var score = 0
        deck.removeAll() // double check that this is waht I want to remove
    }
    
    func stopHits() {
        if randomComputerScore > player.score {
            print("You lost!")
        } else {
            print("You win!")
        }
    }
    
    func hitMe() {
      // generate random card
        // adds scre
        // prints card and score
    }
}



