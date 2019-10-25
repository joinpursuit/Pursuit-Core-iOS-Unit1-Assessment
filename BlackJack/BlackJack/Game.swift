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
    var deck = [Card]()
    var player = Player(score: 0, cards: [String](), playerName: "No Name")
    var hitPlayer = false


    // computed properties
    var hasMoreCards: Bool {
        return !deck.isEmpty // returns false if deck is empty
    }
    var randomComputerScore: Int { // returns random int 18 - 21
        return Int.random(in: 18 ... 21)
    }
    
    //MARK: Methods:
    
    func newGame() {
        player.score = 0
        player.cards.removeAll()
        deck = Card.newDeck(aceValue: 1) // creates the deck
    }
    
    func stopHits() {
        computerVsPlayer()
    }
    
    func hitMe() {
        if hasMoreCards {
            deck = deck.shuffled()
            if let randomCard = deck.popLast() {
                player.cards.append(randomCard.stringify())
                
                // incrementing score
                player.score += randomCard.value
                print("\(player.cards.joined(separator:" ")) score: \(player.score)")
            }
        }
    }
    
    func computerVsPlayer() {
        let computerScore = randomComputerScore
        let userScore = player.score
        
        switch userScore {
        case let user where user > computerScore:
            print("BLACKJACK!! YOU WIN! 🏆 🥳 🏆 🥳 🏆 🥳 🏆  Computer: \(computerScore), You: \(user). ")
        case let user where user < computerScore:
            print("COMPUTER WINS 🏆 --> 💻 Computer: \(computerScore), You: \(user).")
        default:
            print("ITS A TIE!!! 🤷🏻‍♀️ 🤷🏻‍♀️ 🤷🏻‍♀️ ")

        }
    }
    
    func gameStatus() {
        if player.score == 21 {
            print("BLACKJACK!! YOU WIN! 🏆 🥳 🏆 🥳 🏆 🥳 🏆")
        } else if player.score > 21 {
            print("BUST!")
        } 
    }
    
}


