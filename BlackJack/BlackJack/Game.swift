//
//  Game.swift
//  BlackJack
//
//  Created by Ian Bailey on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
var computerScore = 0
class Game {
    var deck: [Card]
    var player: Player
    var hitPlayer: Bool
    
    var hasMoreCards: Bool {
        return !deck.isEmpty
    }
    var randomComputerScore: Int {
        let computerCardPicked = deck.popLast()
        computerScore += computerCardPicked?.value ?? 7
        return computerScore
    }
    
    init(deck: [Card], player: Player, hitPlayer: Bool) {
        self.deck = deck
        self.player = player
        self.hitPlayer = hitPlayer
    }
    
    
    func newGame() -> [Card] {
        let aceValue = [1,11]
        player.score = 0
        computerScore = 0
        let newDeck = Card.newDeck(aceValue: aceValue.randomElement() ?? 5)
        return newDeck
    }
    

    func hitMe() -> Card? {
        guard let cardPicked = deck.popLast() else { return nil }
            player.score += cardPicked.value
            player.cards.append(cardPicked)
        print("\(player.cards) SCORE:\(player.score)")
            return cardPicked
        }
       
        
    }
 

