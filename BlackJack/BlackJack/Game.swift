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
    var hitPlayer: Bool = true
    
    init(deck: [Card], player: Player, hitPlayer: Bool) {
        self.deck = deck
        self.player = player
        self.hitPlayer = hitPlayer
    }
    var hasMoreCards: Bool {
        
        return !deck.isEmpty
    }
    
    var randomComputerScore: Int {
     let computerNum = Int.random(in: 18...21)
     return computerNum
    }
    
    func newGame() {
      deck = Card.newDeck(aceValue: 1)
     player = Player(score: 0, cards: [], playerName: "")
    }
    // gotta work on this function more
    
     func hitMe(userChoice: String) -> Card? {
        //called as the user requests more cards from the deck
          //if userChoice == "hit" {
               deck = Card.newDeck(aceValue: 1)
               deck = deck.shuffled()
               let card = deck.randomElement()
//               var face = Card.stringify()
               player.score += card!.value
               print(card?.stringify() ?? "")
               print("Player Score: \(player.score)")
               if player.score == 21 {
                    print("Player Wins!")
                    deck.removeAll()
               } else if player.score > 21 {
                    print("BUST! Player loses!")
                    deck.removeAll()
               }
               
         //      }
          return deck.popLast()
          }

    func stopHits(userChoice: String) {
        //called if the user wishes to pass their turn. In that case the computer draws a random number and a winner is chosen between the computer's score and the player's score.
     //   if userChoice == "pass"{
          deck = Card.newDeck(aceValue: 1)
          deck = deck.shuffled()
          if player.score > randomComputerScore{
               print("\(player.score) - The player wins this round!")
          } else if randomComputerScore > player.score {
               print("Player: \(player.score)\n Computer: \(randomComputerScore) - The computer wins this round!")
          } else if randomComputerScore == player.score {
               print("Player: \(player.score)\n Computer: \(randomComputerScore) - It's a tie!")
          }
          
     //   }
    }
    
     func computerVsPlayer(randomComputerNumber: Int) {
        //draws a random number for the computer and determines the winner of the game.
     var randomComputerNumber = Card.newDeck(aceValue: 1)
     randomComputerNumber = randomComputerNumber.shuffled()
     print(randomComputerNumber)
     
    }
    
    
}
