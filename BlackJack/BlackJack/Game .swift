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
        let computer = [2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21]
        return computer.randomElement() ?? 0
    
           }


    
// MARK: Methods
    
func newGame() {
    player.cards.removeAll()
    player.score = 0
    }
    
    
    
    
    func stopHits(_ userInput: String) {
      // called if the user wishes to pass their turn. In that case the computer draws a random number and a winner is chosen between the computer's score and the player's score.
//    player.score == deck.randomElement()?.value
        let message = ("Computer: \(randomComputerScore), you: \(player.score)")
        gameStatus()
    
        
    print(message)
    }
    
    

    
    
    
    
    
    
    
    
    
    
    func hitMe(_ userInput: String) {
        
        // called as the user requests more cards from the deck
    
        
        
        
        print("score:\(player.score), computer: \(randomComputerScore)")
        gameStatus()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

func computerVsPlayer() -> Int {
        // draws a random number for the computer and determines the winner of the game.
  

    return randomComputerScore
    }

//
    
    
    
    
    
    
    
    
    
func gameStatus() {
        // takes in the player's card and determines the current score. Here the player score options can be, BlackJack, Bust or Continue playing as their status is still valid for game play.
    if player.score > 21 {
        print("Bust")
    } else if player.score == 21 {
        print("BlackJack")
    }




    }

}










