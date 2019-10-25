//
//  Player.swift
//  BlackJack
//
//  Created by casandra grullon on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct Player {
    var score = 0
    var playersCards = [Card]()
    
    mutating func playerScore() -> Int {
        for card in playersCards {
            self.score += card.value
    }
        return score
}
    
    
    
    
    
    
    
}
