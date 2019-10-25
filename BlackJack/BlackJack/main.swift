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
// There are 52 in a deck of card
var game = Game()
let gamePrompt = "Do you want to hit or stay (hit, stay)"
var gameOver = false
let shuffledDeck = game.newGame()
print(shuffledDeck)

repeat {
     
    print(gamePrompt)
    if !shuffledDeck.isEmpty {
        let playerInput = readLine() ?? ""
            if playerInput == "hit" {
                print("HIT!")
                print(game.hitMe()!)
                game.gameStatus()
    }
        if playerInput == "stay" {
            
        }
    }
    
} while !gameOver
