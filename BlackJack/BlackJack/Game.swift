//
//  Game.swift
//  BlackJack
//
//  Created by casandra grullon on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct Game {
    //MARK: properties
    var deck = [Card]()
    var player : Player
    var hitPlayer : Bool
    
    //computed properties
    var hasMoreCards : Bool {
        return !deck.isEmpty
    }
    
    var randomComputerScore : Int {
        return Int.random(in: 17...21)
    }
    
    //MARK: methods
    
    //1.
    func newGame() {
        
    }
    
    //2.
    mutating func stopHits() {
        if hitPlayer == false {
            let result = player.playerScore(playersHand: player.playersCards)
            if result > computerVPlayer(compScore: randomComputerScore) {
                print("You Won!! 🥳")
            } else if result == computerVPlayer(compScore: randomComputerScore) {
                print("It's a tie! 😅")
            } else {
                print("You lost 😢")
            }
        }
    }
    
    //3.
    mutating func hitMe() {
        switch hitPlayer {
        case true :
            for card in deck {
                player.playersCards.append(card)
            }
            var result =  player.playerScore(playersHand: player.playersCards)
            
        default:
            print("Not valid")
        }
    }
    
    //4.
    func computerVPlayer(compScore: Int) -> Int {
        let computerScore = randomComputerScore
        return computerScore
    }
    
    //5.
    func gameStatus() {
        
    }
    
}
