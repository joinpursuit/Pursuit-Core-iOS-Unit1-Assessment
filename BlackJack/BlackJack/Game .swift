//
//  Game .swift
//  BlackJack
//
//  Created by Oscar Victoria Gonzalez  on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {
    
    // MARK: Properties
    
    var deck = [Card]()
    var player = Player(score: 0, cards: [Card](), playerName: "")
    var hitPlayeris = true
    
    var hasMoreCards: Bool {
        return !deck.isEmpty
    }
    
    
    var randomComputerScore: Int {
        let computer = Card.newDeck(aceValue: 1).randomElement()?.value ?? 0
        
        return computer
    }
    
    
    
    // MARK: Methods
    
    func newGame() {
       
    }
    
    
    func stopHits() -> String {
        
        player.cards.randomElement()?.stringify() ?? ""
        
        
    }
    
    
    
    func hitMe() -> String {
        
        let instanceOfhitMe = Card.newDeck(aceValue: 1).randomElement()
        let result = instanceOfhitMe?.stringify() ?? ""
        let somePlayer = instanceOfhitMe?.value ?? 1
        

        player.score = somePlayer
        
        return result
    }
    
    
    func computerVsPlayer(){
        
    
    }
    
    
    func gameStatus() {
        if player.score > 21 {
            print("Bust")
        } else if player.score == 21 {
            print("BlackJack")
        }
        
    }
    
}










