//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
var aceValueSet = false
var aceValue = Int()
var gameOver = false

print("Welcome to BlackJack! What is your name?")
let name = readLine() ?? ""

print("Hello \(name). Please set your Ace value. (1 or 11)")
repeat {
    let oneOrEleven = Int(readLine() ?? "") ?? -1
    guard oneOrEleven == 1 || oneOrEleven == 11 else {
        print("Error, please type in 1 or 11.")
        continue
    }
    aceValueSet = true
    aceValue = oneOrEleven
} while aceValueSet == false


let player1 = Player(playerName: name)
let blackJackGame = Game(deck: Card.newDeck(aceValue: aceValue), player: player1, hitPlayer: true)

repeat {
    blackJackGame.newGame(aceValue)
    repeat {
        blackJackGame.choicePrompt() //try doing hitMe and stopHits in here.
        if blackJackGame.hitPlayer {
            blackJackGame.hitMe()
        } else {
            blackJackGame.stopHits()
            break
        }
    } while blackJackGame.player.score < 21
    
    print("Would you like to play again? (yes, no)")
    let yesOrNo = readLine() ?? ""
    if yesOrNo == "no" {
        gameOver = true
    }
} while gameOver == false
