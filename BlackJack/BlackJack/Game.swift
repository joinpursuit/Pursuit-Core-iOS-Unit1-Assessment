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

    func stopHits() {
        if Game.player.score > computerScore {
            print()
            print("You have won!")
        } else {
            print("You have lost")
        }
    }

    func hitMe() {
        
        let randomCard = shuffledDeck.first
        
        score += (randomCard?.value ?? 0)
        currentCards.append(randomCard?.stringify() ?? "")
        print(currentCards)
        //print(randomCard?.stringify() ?? 2)
        print("Total Score: \(score)")
        shuffledDeck.removeFirst()
        
        if score == 21 {
            print("Black Jack! You win!")
        }
        if score >= 22 {
            print("Bust! You lose!")
        }
      print("There are \(shuffledDeck.count) left in the deck of cards")
    }
    
    func computerVsPlayer() {
        if computerScore > score {
            print("You scored: \(score) Computer scored: \(computerScore)")
            print()
            print("You lost!")
        } else {
            print("You scored: \(score) Computer scored: \(computerScore)")
            print()
            print("You won!")
        }
    }

    func gameStatus() {
        print(Game.deck)
        print(Game.player.score)
    }
}

    

