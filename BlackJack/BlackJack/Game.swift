//
//  Game.swift
//  BlackJack
//
//  Created by casandra grullon on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct Game {
    //properties
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
    
    //methods
    func newGame() {
        
    }
    
    func stopHits() {
        if hitPlayer == false {
        
        }
    }
    
    func hitMe() {
        if hitPlayer == true {
            
        }
    }
    
    func computerVPlayer() {
        var computerScore = randomComputerScore
        if computerScore > .score {
            print("You lost! ")
        }
    }
    
    func gameStatus() {
        
    }
    
}
