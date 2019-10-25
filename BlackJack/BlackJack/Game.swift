//
//  Game.swift
//  BlackJack
//
//  Created by Yuliia Engman on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {
    var deck = [Card]()
    var player = Player(score: 0, cards: [], playerName: "Yulia") // something is incorrectr here
    var hitPlayer = Bool()
    
    var hasMoreCards: Bool {
        get {
            return !deck.isEmpty // check if I want if true or false
        }
    }
    var randomComputerScore: Int {
        get {
            return Int(18 + arc4random_uniform(21 - 18 + 1))
        }
    }
    
    func newGame() {
        player.score = 0
        deck.removeAll() // double check that this is waht I want to remove
    }
    
    func computerVsPlayer() { // for now I think it completelly substiture stopFits method
        if randomComputerScore > player.score {
            print("You lost!")
        } else {
            print("You win!")
        }
    }
    
    func hitMe() {
        var shuffledDeck = deck.shuffled() // shuffle the deck
        let randomCardForPlayer = shuffledDeck.removeLast() //removes element from deck array and returns it
        player.score += randomCardForPlayer.value// adds score
        print("\(randomCardForPlayer) score: \(player.score)")// prints card and score // decide how to print following random cards
    }
    
    func gameStatus() {
        if player.score == 21 {
            print("BlackJack")
        } else if player.score > 21 {
            print("Bust")
        } else {
            print("Continue")
        }
    }
}



