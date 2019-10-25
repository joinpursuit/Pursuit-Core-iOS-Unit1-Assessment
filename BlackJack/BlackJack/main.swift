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

var gameOver = false

var playAgain = true

let gameMessage = """
Do you want to hit or pass?

"""

repeat {

print(gameMessage)

let userResponse = readLine() ?? ""

if userResponse == "hit" {
    game.hitMe(userResponse)
} else if  userResponse == "pass"  {
    game.stopHits(userResponse)
} else {
    print("Invalid answer")
}

} while playAgain

