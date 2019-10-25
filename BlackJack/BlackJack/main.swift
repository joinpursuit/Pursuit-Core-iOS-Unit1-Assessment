//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation


var game = Game()
let gamePrompt = "Do you want to hit or stay (hit, stay)"
var gameOver = false
var playAgain = false
var shuffledDeck = game.newGame()






repeat {
    
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
            game.stopHits()
        }
    }
    
} while !gameOver
    print("Do you want to play again? yes or no")
    let playerPlayAgain = readLine() ?? " "
    if playerPlayAgain == "yes" {
        
        shuffledDeck.removeAll()
        shuffledDeck = game.newGame()
        playAgain = true
    } else {
        print("Thanks for Playing")
        playAgain = false
    }
    
    
} while playAgain
