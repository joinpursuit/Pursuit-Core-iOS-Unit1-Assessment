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
    var hitPLayer: Bool
    
    init(deck: [Card], player: Player, hitPlayer: Bool) {
        self.deck = deck
        self.player = player
        self.hitPLayer = hitPlayer
    }
        var hasMoreCards: Bool {
            
            return !deck.isEmpty
        }
        
        var randomComputerScore: Int {
            
            return player.score
        }
    
    func newGame() {
        self.deck = [Card]()
    }
    // gotta work on this function more
    
    func stopHits(userChoice: String) {
        var userChoice = userChoice
        userChoice = readLine()?.lowercased() ?? ""
        
        if userChoice == "pass"{
            print(deck.randomElement() ?? "")
        }
    }
    
    
    
    }
