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
    var player = Player(score: 0, cards: [Card](), playerName: "")
    var hitPlayeris = true
    

    var hasMoreCards: Bool {

        
        return !deck.isEmpty
    }
    

    var randomComputerScore: Int {
       let computer = Card.newDeck(aceValue: 1).randomElement()?.value ?? 0
       return computer
    }


    
// MARK: Methods
    
func newGame() {
    player.cards.removeAll()
    player.score = 0
    }
    
    
    
    
    func stopHits() {
      // called if the user wishes to pass their turn. In that case the computer draws a random number and a winner is chosen between the computer's score and the player's score.
       

    }
    
    

    
    
    
    
    
    
    
    
    
    
    func hitMe() -> String {
        let result = Card.newDeck(aceValue: 1).randomElement()?.stringify() ?? ""
        player.score = Card.newDeck(aceValue: 1).randomElement()?.value ?? 0
        return result
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

func computerVsPlayer(){
        // draws a random number for the computer and determines the winner of the game.


   
    }


    
    
    
    
    
    
    
    
    
func gameStatus() {
        // takes in the player's card and determines the current score. Here the player score options can be, BlackJack, Bust or Continue playing as their status is still valid for game play.
    if player.score > 21 {
        print("Bust")
    } else if player.score == 21 {
        print("BlackJack")
    }




    }

}










