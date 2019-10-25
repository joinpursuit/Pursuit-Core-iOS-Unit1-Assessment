//
//  Player.swift
//  BlackJack
//
//  Created by casandra grullon on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Player {
    var score = 0
    var playersCards = [Card]()
    
    init(score: Int,
         playerCards: [Card]) {
        self.score = score
        self.playersCards = playerCards
    }
    
//    func playerScore() -> Int {
//        for card in playersCards {
//            self.score += card.value
//    }
//        return score
//}
    
    
    
}
