//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

let game = Game()
var gameOver = false
var hitLoop = false
var player = Game.player.playerName

print("Welcome to Black Jack!")
print()
game.setName()

repeat {
    game.newGame()
    game.hitMe()
    
    repeat {
    print("Would you like to hit or pass? (hit, pass)")
    let userInput = readLine()?.lowercased() ?? "pass"
        print(game.currentCards)
    if userInput == "hit" {
        game.hitMe()
        gameOver = true
        hitLoop = true
        if game.score >= 21 {
            break
        }
        print()
    }
    if userInput == "pass" {
        game.computerVsPlayer()
        gameOver = false
        hitLoop = false
        }
    } while hitLoop
    print("Would you like to play again?")
    let contPrompt = readLine()?.lowercased()
    if contPrompt == "no" {
        gameOver = false
    } else if contPrompt == "yes" {
       // game.newGame()
        gameOver = true
    } else {
        print("Invalid choice, better next time...")
        gameOver = false
    }
} while gameOver
