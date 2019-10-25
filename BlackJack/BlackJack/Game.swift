//
//  Game.swift
//  BlackJack
//
//  Created by Andréa Evans on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
//see init below
class Game {
    var deck: [Card] = []
    var player: Player
    var hitPlayer: Bool
    var computerScore = 0
    
    var hasMoreCards: Bool {
        return !deck.isEmpty
    }
    var randomComputerScore: Int {
        let rangeScore = 17..<22
        for _ in rangeScore {
            return rangeScore.randomElement() ?? 17
        }
    }
    //I'm not sure what I'm missing here. Is this not the way I'd declare a class
init(deck: [Card],
    player: Player,
    hitPlayer: Bool) {
    self.deck = deck
    self.player = player
    self.hitPlayer = hitPlayer
        }
    
        func newGame() {
            deck = Card.newDeck(aceValue: 1)
            player.score = 0
            computerScore = 0
        }
    
    

func stopHits() {
    //not sure yet???
    //if/else statement?
}
//removeAll maybe
func hitMe() -> Card {
 deck = deck.shuffled()
    return deck.removeLast()
}

func computerVsPlayer() {
    if game.player.score > computerScore {
        print("You scored \(game.player.score) points. Dealer scores \(randomComputerScore)")
        print("Congratulations Rain Man! You're a winner!")
        print()
        print("And FILTHY RICH!!!")
    } else if computerScore > game.player.score {
        print("I guess beginner's luck ain't so lucky!")
        print("Feel free to give us your money anytime.")
        print()
        print("We promise the proceeds go to a worthy cause 🤑🤑🤑")
    } else {
        print("A TIE???")
    }
        
    }

func gameStatus() {
    switch gameStatus() {
    case game.player.score > 21 :
        print("BUSTER!! You Lose. 🙂🙃🙂🙃🙂🙃")
    case game.player.score == 21 :
         print("BLACKJACK BAYBEEEEEEE!🤯")
    default:
        print("Continue playing")
   }
}

}

