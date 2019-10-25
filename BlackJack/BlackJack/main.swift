//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

print("""
888     888                888       d8b                888
888     888                888       Y8P                888
888     888                888                          888
88888b. 888 8888b.  .d8888b888  888 8888 8888b.  .d8888b888  888
888 "88b888    "88bd88P"   888 .88P "888    "88bd88P"   888 .88P
888  888888.d888888888     888888K   888.d888888888     888888K
888 d88P888888  888Y88b.   888 "88b  888888  888Y88b.   888 "88b
88888P" 888"Y888888 "Y8888P888  888  888"Y888888 "Y8888P888  888
                                     888
                                    d88P
                                  888P"
""")


// creating instance of Game
var game = Game()
// class newGame on instance
game.newGame()

var gameOver = false

 print("Please enter you name")
 let name = readLine() ?? "No Name"
 // creating player
 let player1 = Player(score: 0, cards: [String](), playerName: name.capitalized)
 game.player = player1
 print("Hello \(game.player.playerName)")

 

repeat {

    var userSelection = ""
    print()
    repeat {
        print("Would you like to hit or pass? (hit, pass)")
        userSelection = readLine() ?? ""
        
        if userSelection == "hit" {
            game.hitMe()
            print(game.deck.count)
            
            // print(game1.player.score)
        } else if userSelection == "pass" {
            game.stopHits() // i think
        }
        print()
    } while game.player.score < 21 && userSelection == "hit"
    
    game.gameStatus()
    
    print("Would you like to try your luck out again? (yes, no)")
    let playAgain = readLine() ?? ""
    if playAgain == "no" {
        gameOver = true
    } else if playAgain == "yes" {
        game.newGame()
    }
    
} while !gameOver

print("Thanks for playing Jack, Uh I mean \(game.player.playerName)! I hope you had fun 😬.")
