//
//  Game.swift
//  BlackJack
//
//  Created by Gregory Keeley on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {
    static var deck = Card.newDeck(aceValue: 1)
    static var player = Player.init()
    static var hitPlayer = Bool()
    
    var currentCards = String().description
    var shuffledDeck = Game.deck.shuffled()
    
    var score = 0
    var computerScore = Int.random(in: (17...21))
    var hasMoreCards: Bool {
        return !Game.deck.isEmpty
    }
    func newGame() {
        Game.deck = Card.newDeck(aceValue: 1)
        score = 0
        currentCards.removeAll()
        shuffledDeck = Game.deck.shuffled()
    }
    func hitMe() {
        let randomCard = shuffledDeck.first
        score += (randomCard?.value ?? 0)
        currentCards.append(randomCard?.stringify() ?? "")
        currentCards.append(" ")
        
        print("\(currentCards)\n")

        print("\(Game.player.playerName) Score: \(score)")
        
        shuffledDeck.removeFirst()
        
        if score == 21 {
            print("Black Jack! You win!")
        }
        if score >= 22 {
            print("Bust! You lose!")
        }
        if hasMoreCards == false {
            print("The deck is empty, would you like to start over?")
        }
    }
    func computerVsPlayer() {
        if computerScore > score {
            print()
            print("\(Game.player.playerName) score: \(score) Computer score: \(computerScore)")
            print()
            print("You lost!")
        } else {
            print()
            print("\(Game.player.playerName) score: \(score) Computer score: \(computerScore)")
            print()
            print("You won!")
        }
    }
    func setName() {
        print("Please enter name: \("")")
        Game.player.playerName = readLine() ?? "Your"
    }
}

    

