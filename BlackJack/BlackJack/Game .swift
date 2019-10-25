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
    var player: Player
    var hitPlayeris: Bool
    
// Computed Properties
//
//    var hasMoreCards: Bool {
//
//
//        }

    var randomComputerScore: Int {


        let randomNumber = [1,3,5,6,7,11,4,20]
        return randomNumber.randomElement() ?? 18
    }

    
// Initializers:
    
    init(deck:[Card],
         player: Player,
         hitPlayeris: Bool) {
        self.deck = deck
        self.player = player
        self.hitPlayeris = hitPlayeris
    }
    
    
    
    
    
// MARK: Methods
    
func newGame() {
       // resets the game
    player.score = 0
    deck.removeAll()
    }
    
    
    
    
    
    
    
    
    
    
//func stopHits(_ userInput: String) -> Int {
//      // called if the user wishes to pass their turn. In that case the computer draws a random number and a winner is chosen between the computer's score and the player's score.
//    if userInput == "pass" {
//
//    }
//      
//    } return

    
    
    
    
    
    
    
    
    
    
func hitMe() {
        // called as the user requests more cards from the deck
    for card in Card.newDeck(aceValue: 1) {
        print(card)
    }
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//
//func computerVsPlayer() -> Int {
//        // draws a random number for the computer and determines the winner of the game.
////    return randomComputerScore
////    }
    
    
    
    
    
    
    
    
    
    
    
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









