//
//  Player.swift
//  BlackJack
//
//  Created by casandra grullon on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct Player {
    var score : Int
    var playersCards : [Card]
    var playerName : String
    
    mutating func playerScore(playersHand: [Any]) -> Int {
        for card in playersCards {
            self.score += card.value
    }
        return score
}
    
    
    
    
    
    
    
}
