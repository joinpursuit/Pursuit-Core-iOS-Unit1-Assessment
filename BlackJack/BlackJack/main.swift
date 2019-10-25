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

repeat{
    print("The game is : BlackJack!")
    print("Do you want to hit or pass?")
    let userResponse = readLine() ?? ""
    //repeat{
        print("Do you want to hit or pass?")
        //game.gameStatus()
        game.hitMe(userResponse: userResponse)
        
    //} while game.hasMoreCards
    
}while gameOver == true


