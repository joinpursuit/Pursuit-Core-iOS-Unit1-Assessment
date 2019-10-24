//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

var runGame = true
var newCard: Card
var playerInput = ""
print("Enter Your Name\n")
let playerName = readLine() ?? "unknown"
let game = Game(deck: Card.newDeck(aceValue: 1), player: Player(playerName: playerName), hitPlayer: true)
newCard = game.hitMe()
game.player.cards.append(newCard)
game.player.score += newCard.value

repeat {
    
    if game.player.score < 21 {
        game.playerScore()
        game.gameStatus()
    } else {
        game.playerScore()
        game.gameStatus()
    }
    
    playerInput = readLine()?.lowercased() ?? "unknown"
    
    switch playerInput {
    case "hit":
        newCard = game.hitMe()
        game.player.cards.append(newCard)
        game.player.score += newCard.value
    case "h":
        newCard = game.hitMe()
        game.player.cards.append(newCard)
        game.player.score += newCard.value
    case "pass":
        game.computerScore = game.stopHits()
        if game.computerScore > game.player.score {
            print("Computer Wins!")
            print("Your Score: \(game.player.score), Computers Score: \(game.computerScore)")
            print("Would you like to play again?\n(Yes / No)")
            playerInput = readLine()?.lowercased() ?? "no"
            runGame = game.continueGame(userInput: playerInput)
            game.newGame()
        } else if game.computerScore == game.player.score {
            print("Draw")
            print("Your Score: \(game.player.score), Computers Score: \(game.computerScore)")
            print("Would you like to play again?\n(Yes / No)")
            playerInput = readLine()?.lowercased() ?? "no"
            runGame = game.continueGame(userInput: playerInput)
            game.newGame()
        } else {
            print("\(playerName) Wins!")
            print("Your Score: \(game.player.score), Computers Score: \(game.computerScore)")
            print("Would you like to play again?\n(Yes / No)")
            playerInput = readLine()?.lowercased() ?? "no"
            runGame = game.continueGame(userInput: playerInput)
            game.newGame()
        }
    case "yes":
        runGame = game.continueGame(userInput: playerInput)
        game.newGame()
    case "no":
        runGame = false
    default:
        print("========================================")
        print("       NOT SURE IF I UNDERSTAND")
        print("========================================")
        continue
    }
    print("========================================")
} while runGame
