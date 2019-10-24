//
//  Game.swift
//  BlackJack
//
//  Created by Maitree Bain on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {
var deck = [Card]()
var player: Player
var hitPlayer: Bool

    init(deck: [Card], player: Player, hitPlayer: Bool) {
    self.deck = deck
    self.player = player
    self.hitPlayer = hitPlayer
}
    var hasMoreCards: Bool {
        
        return !deck.isEmpty
    }
    
    var randomComputerScore: Int {
        
        return player.score
    }

func newGame() {
    self.deck = [Card]()
}
// gotta work on this function more

func stopHits(userChoice: String) {
    //called as the user requests more cards from the deck
    Card.newDeck(aceValue: 1)
    if userChoice == "hit" {
        for card in deck{
            print(card)
        }
    }
    }
    
    func hitMe(userChoice: String) {
        //draws a random number for the computer and determines the winner of the game.
        if userChoice == "pass"{
            print("yer granni")
        }
    }
    
        func computerVsPlayer() {
         //draws a random number for the computer and determines the winner of the game.
            
        }
        
        
        
        
        
    }
