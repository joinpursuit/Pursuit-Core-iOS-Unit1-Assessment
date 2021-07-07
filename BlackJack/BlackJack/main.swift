//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

//// TODO: remove these lines after you have added the Suit and FaceCard enums as per the assessment README
//print("There are \(Card.newDeck(aceValue: 1).count) in a deck of cards")
//// There are 52 in a deck of cards


let game = Game()



//var test = Card.newDeck(aceValue: 1).randomElement()?.stringify() ?? ""
//print(test)
//
//var test2 = Card.newDeck(aceValue: 1).randomElement()?.value ?? 0
//print(test2)




var gameOver = false
var playAgain = true

print("Enter Your name")
var enterYourName = readLine() ?? ""

print()

print("Welcome to BlackJack \(enterYourName.capitalized)")

print()

let gameMessage = """
Do you want to hit or pass? (hit, pass)

"""

repeat {
    
    print(gameMessage)
    
    let userResponse = readLine() ?? ""
    
    if userResponse == "hit" {
        let response = game.hitMe()
        print("\(response) score: \(game.player.score)")
    } else if userResponse == "pass" {
        let answer = game.stopHits()
        print("\(answer)your score: \(game.player.score), computer: \(game.randomComputerScore)")
        
    }
    
} while playAgain

