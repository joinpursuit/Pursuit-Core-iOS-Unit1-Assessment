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

var game = Game()
game.newGame()
var gameOver = true

print("The game is : BlackJack!")

repeat{
    print("Do you want to hit or pass?")
    let userResponse = readLine() ?? ""
    switch userResponse {
    case "hit" :
        if let card = game.hitMe() {
            print(game.gameStatus(card: card))
        }
    case "pass" :
        game.stopHits()
        //print(game.gameStatus())
    default :
        print("Not valid. Try typing \'hit\' or \'pass\'")
    }

}while game.hasMoreCards


