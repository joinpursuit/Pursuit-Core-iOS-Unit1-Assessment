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
    var player = Player(score: 0, cards: [], playerName: "Andrea")
    var hitPlayer = true
   
    
    var hasMoreCards: Bool {
        return !deck.isEmpty
    }
    var randomComputerScore: Int {
        let rangeScore = Int.random(in: 17..<22)
       return rangeScore
    }
    //I'm not sure what I'm missing here. Is this not the way I'd declare a class
//init(deck: [Card],
//    player: Player,
//    hitPlayer: Bool) {
//    self.deck = deck
//    self.player = player
//    self.hitPlayer = hitPlayer
//        }
    
        func newGame() {
            deck = Card.newDeck(aceValue: 1)
            player.score = 0
            
        }
    
    

func stopHits() {
    computerVsPlayer()
}
    
//removeAll maybe
    func hitMe() -> Card? {
var playersCard = deck.shuffled()
let randCard = playersCard.popLast()
return randCard
}

func computerVsPlayer() {
    
    if player.score > randomComputerScore {
        print("You scored \(player.score) points. Dealer scores \(randomComputerScore)")
        print("Congratulations Rain Man! You're a winner!")
        print()
        print("And FILTHY RICH!!!")
    } else if randomComputerScore > player.score {
        print("I guess beginner's luck ain't so lucky!")
        print("Feel free to give us your money anytime.")
        print()
        print("We promise the proceeds go to a worthy cause 🤑🤑🤑")
    } else {
        print("A TIE???")
    }
        
    }
        
//if statement instead???
        
   func gameStatus(pointsPerCard : Int) -> Int  {
    player.score += pointsPerCard
     let newScore = player.score
    switch newScore {
    case 21...32 :
        print("BUSTER!! You Lose. 🙂🙃🙂🙃🙂🙃")
        gameOver = true
    case 21 :
         print("BLACKJACK BAYBEEEEEEE!🤯")
    case 1..<21 :
        print("Hit or Pass?")
    default:
        print("Continue playing")
   }
    return newScore
}

}

