//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

// TODO: remove these lines after you have added the Suit and FaceCard enums as per the assessment README
//print("There are \(Card.newDeck(aceValue: 1).count) in a deck of cards")
// There are 52 in a deck of cards

//pushing to gitHub
func getUserInput() -> String{
    guard let userInput = readLine() else {
        return "Invalid reponses detected"
    }
    return userInput
}

//prompt to get user name
print("What is you name?")
let userName = getUserInput()

let deckOfCards = Card.newDeck(aceValue: 1)
let player = Player(score: 0, cards: [deckOfCards[Int.random(in: 1...Card.newDeck(aceValue: 1).count)]], playerName: userName)
let game = Game(deck: deckOfCards, player: player, hitPlayer: false)
game.newGame()

var gameOver = false
let userPrompt = "WELCOME TO BLACKJACK"

repeat {
    print(userPrompt)
    
} while gameOver
