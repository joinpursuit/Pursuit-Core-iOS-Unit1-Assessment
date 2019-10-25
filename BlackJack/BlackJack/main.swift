//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
repeat {
print("There are \(Card.newDeck(aceValue: 1).count) cards in a deck of cards")

let playGame = Game()
playGame.newGame()
playGame.deck = Card.newDeck(aceValue: 1)
var gameOver = false
var playGameAgain = readLine() ?? "no"
let prompt = "Hit or Pass, Darlin'?"


    repeat {
        print(prompt)
        print("Welcome to BILLIE BETTE's BIG HOUSE OF BLACKJACK!")
        print()
        print("Please enter your name.")
        let playerName: String = readLine() ?? "Johnnie Doe"

        print("HEY THERE \(playerName)!")
        print()
        print("Happy to make your aquaintence!")
        print()
        print()
        print("There are \(Card.newDeck(aceValue: 1).count) cards in a deck of cards")
        print()
        print("My dealer is willin' and ready.")
        
        let playerResponse = readLine() ?? ""
        

        switch playerResponse {
        case "hit" :
            let hit = playGame.hitMe()
        case "pass" :
            playGame.stopHits()
        default :
            print("Not a valid input.")
    }

} while gameOver == false
    
    print("Take another stab? (yes or no)")
    
} while 
//going to bed now
