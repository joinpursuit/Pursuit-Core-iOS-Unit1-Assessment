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

let game = Game()
game.newGame()
var gameOver = true

var prompt = "Do you wish to hit or pass?(hit, pass)"

repeat  {
    print(prompt)
    let playreResponse = readLine()
    
    switch playreResponse   {
    case "hit":
        let hitCard = game.hitMe()
        let stringHitCard = hitCard?.stringify()
        print(stringHitCard ?? "Sorry")
        
    case "pass":
        game.stopHits()
        
    default: print("Error")
    }
    
} while gameOver == false

