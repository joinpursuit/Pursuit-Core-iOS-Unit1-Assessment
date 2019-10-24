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

var game1 = Game()

game1.newGame()

var gameOver = false

repeat {
    print("Please enter you name")
    game1.player.playerName = readLine() ?? "No Name"
    let name = game1.player.playerName
    print("Hello \(name)")
    
    // i need a repeat while the score is less than 21
    
    print("Do you want to hit or pass? (hit, pass)")
    let userSelection = readLine() ?? ""
    
    if userSelection == "hit" {
        game1.hitMe()
    } else if userSelection == "pass" {
        game1.stopHits() // i think 
    }
    

    
} while gameOver
