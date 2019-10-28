//
//  Game.swift
//  BlackJack
//
//  Created by Joshua Wynter on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {
    var score = 0
    var deck = [Card]()
    var player = Player.self
    var hitplayer : Bool {
        return true; false
    }
    var hasMoreCards: Bool {
        return !deck.isEmpty
    }
    var randomComputerScore = Int()
    
    func newGame() {
           score = 0
           //questions = [Question]()
           deck.removeAll()
       }
    func stopHits() {
        
    }
}

    
