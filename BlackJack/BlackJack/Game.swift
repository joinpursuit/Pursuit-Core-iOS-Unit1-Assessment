//
//  Game.swift
//  BlackJack
//
//  Created by Matthew Ramos on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {
    var deck = [Card]()
    var player: Player
    var hitPlayer = true
    var cardString = ""
    var busted: Bool {
        return player.score > 21
    }
    var randomComputerScore = Int.random(in: 17...21)
    
    init(player: Player) {
        self.player = player
    }
    func hitMe () -> Card? {
        guard let newCard = deck.popLast() else {
            return nil
        }
       return newCard
    }
    func gameStatus (_ card: Card, _ hand: [Card]) -> String {
        if card.isFaceCard == true {
            cardString += card.stringify()
        } else {
            cardString += String(card.value)
            cardString += card.suit.rawValue
        }
        player.score += card.value
        print(cardString)
        return "Your score is \(player.score)"

    }
    func computerVsPlayer (_ score: Int) -> String {
        if randomComputerScore >= score {
           return "Dealer has \(randomComputerScore). You lose!"
            
        } else {
           return "Dealer has \(randomComputerScore). You win!"
        }
        
    }
    func newGame () {
        player.score = 0
        game.cardString = ""
        game.hitPlayer = true
        game.randomComputerScore = Int.random(in: 17...21)
    }
    
}
