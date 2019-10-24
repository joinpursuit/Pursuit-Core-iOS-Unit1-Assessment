//
//  Game.swift
//  BlackJack
//
//  Created by Amy Alsaydi on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {
    //MARK: Properties:
    
    // instance properties
    var deck: [Card]
    var player: Player
    var hitPlayer: Bool
    
    // computed properties
    var hasMoreCards: Bool {
        return !deck.isEmpty // returns false if deck is empty
    }
    var randomComputerScore: Int { // returns random int 18 - 21
        return Int.random(in: 18 ... 21)
    }
    
    //designated iniitializer: this not be needed.
    
    init(deck: [Card], player: Player, hitPlayer: Bool) {
        self.player = player
        self.deck = deck
        self.hitPlayer = hitPlayer
    }
    //MARK: Methods:
    
    func newGame() {
        player.score = 0
        deck.removeAll()
    }
    
    func stopHits() {
        computerVsPlayer()
    }
    
    func hitMe() {
        if let randomCard = Card.newDeck(aceValue: 1).randomElement(){
            print(randomCard.stringify())
        }
    }
    
    func computerVsPlayer() {
        let computerScore = self.randomComputerScore
        let userScore = player.score
        // if userScore > computerScore
        switch userScore {
        case let user where user > computerScore:
            print("BLACKJACK!! YOU WON! Computer: \(computerScore), You: \(user). ")
        case let user where user < computerScore:
            print("COMPUTER WINS Computer: \(computerScore), You: \(user).")
        default:
            print("ITS A TIE")
            
        }
    }
    
    func gameStatus(score: Int) {
        
    }
    
}
