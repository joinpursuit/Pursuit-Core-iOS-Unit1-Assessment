//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

// TODO: remove these lines after you have added the Suit and FaceCard enums as per the assessment README
print("There are \(Card.newDeck(aceValue: 1).count) in a deck of cards")
// There are 52 in a deck of cards

//for card in Card.newDeck(aceValue: 1) {
//    print(card)
//    print(card.stringify())
//    break
//}

// print(Card.newDeck(aceValue: 1).randomElement()) optional



// creating instance of Game
var game1 = Game()
// class newGame on instance
game1.newGame()

var gameOver = false


repeat {
    print("Please enter you name")
    let name = readLine() ?? "No Name"
    // creating player
    let player1 = Player(score: 0, cards: [Card](), playerName: name.capitalized)
    game1.player = player1
    print("Hello \(game1.player.playerName)")
    
    
    print(game1.player.cards) // []
    print(game1.player.score) // 0
    
    var userSelection = ""
    // i need a repeat while the score is less than 21
    print()
    repeat {
        print("Do you want to hit or pass? (hit, pass)")
        userSelection = readLine() ?? ""
        
        if userSelection == "hit" {
            game1.hitMe()
            
            
            // print(game1.player.score)
        } else if userSelection == "pass" {
            game1.stopHits() // i think
        }
        print()
    } while game1.player.score < 21 && userSelection == "hit"
    
    game1.gameStatus()
    
    
} while gameOver
