//
//  Game .swift
//  BlackJack
//
//  Created by Oscar Victoria Gonzalez  on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {
    
// MARK: Properties
    
    var deck = [Card]()
    var player = Player(score: 0, cards: [], playerName: "")
    var hitPlayeris = true
    
// Computed Properties

    var hasMoreCards: Bool {

        
        return !deck.isEmpty
    }
    
// Computed Properties

    var randomComputerScore: Int {
        var randomCardValue = deck.randomElement()
        randomCardValue?.value
        return randomCardValue?.value ?? 18
    }
// Initializers:
    
//    init(deck:[Card],
//         player: Player,
//         hitPlayeris: Bool) {
//        self.deck = deck
//        self.player = player
//        self.hitPlayeris = hitPlayeris
//    }
    
    
    
    
    
// MARK: Methods
    
func newGame() {

// resets the game
    
    player.score = 0
    deck.removeAll()
    
    }
    
    
    
    
    
    
    
    
    
    
func stopHits(_ userInput: String) -> Int {
      // called if the user wishes to pass their turn. In that case the computer draws a random number and a winner is chosen between the computer's score and the player's score.
    if userInput == "pass" {
        print("You chose to pass")
        player.score == 7
    }
    
    return randomComputerScore
    
    }

    
    
    
    
    
    
    
    
    
    
 func hitMe() {
        
        // called as the user requests more cards from the deck
        
    
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

func computerVsPlayer() -> Int {
        // draws a random number for the computer and determines the winner of the game.
    
    
    return randomComputerScore
    }
    
    
    
    
    
    
    
    
    
    
    
func gameStatus() {
        // takes in the player's card and determines the current score. Here the player score options can be, BlackJack, Bust or Continue playing as their status is still valid for game play.
    if player.score > 21 {
        print("Bust")
    } else if player.score == 21 {
        print("BlackJack")
    } else if player.score < 21 {
        print("Continue")
    }
    
    
    
    
    }
    
}









