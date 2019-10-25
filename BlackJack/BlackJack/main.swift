//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

print("There are \(Card.newDeck(aceValue: 1).count) cards in a deck of cards")

let playGame = Game()
playGame.newGame()
playGame.deck = Card.newDeck(aceValue: 1)

print("Welcome to BILLIE BETTE's BIG HOUSE OF BLACKJACK!")
print()
print("Please enter your name.")
let playerName: String = readLine() ?? "Johnnie Doe"

print("HEY THERE \(playerName)!")
print()
print("Happy to make your aquaintence today!")
print("My dealer is willin' and ready.")
// playGame.hitMe()
var gameOver = false
print("Hit or Pass, Darlin'?")
repeat {
    
   let playersResponse = readLine() ?? ""
    switch playersResponse {
    case "hit" :
        playGame.hitMe()
    case "pass" :
        playGame.stopHits()
    default :
        print("Not a valid input.")
    }
    
} while playGame.player.score < 21

//going to bed now
