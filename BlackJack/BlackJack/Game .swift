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
    

    var hasMoreCards: Bool {

        
        return !deck.isEmpty
    }
    

    var randomComputerScore: Int {
         let randomCardValue = deck.randomElement()
         
        
    
        return randomCardValue?.value ?? 14
    }


    
// MARK: Methods
    
func newGame() {
    player.cards.removeAll()
    player.score = 0
    }
    
    
    
    
    func stopHits(_ userInput: String)  {
      // called if the user wishes to pass their turn. In that case the computer draws a random number and a winner is chosen between the computer's score and the player's score.
//    player.score == deck.randomElement()?.value
        let message = ("You loose, computer: \(randomComputerScore), you: 12")
        
        
    print(message)
    }
    
    

    
    
    
    
    
    
    
    
    
    
    func hitMe(_ userInput: String) {
        
        // called as the user requests more cards from the deck
    
        
//    
        player.score = deck.randomElement()?.value ?? 21
        
    print("score: \(player.score)")
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

func computerVsPlayer() -> Int {
        // draws a random number for the computer and determines the winner of the game.
    if randomComputerScore > player.score {
        print("you loose")
    } else if randomComputerScore < player.score{
        print("You win")
    }
    
    
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









