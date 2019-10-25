//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
var playAgainResponse = ""
// TODO: remove these lines after you have added the Suit and FaceCard enums as per the assessment README
// There are 52 in a deck of cards

let game = Game()
var prompt = "Do you wish to hit or pass?(hit, pass)"
var gameOver = false
var currentScore = 0


//var newPlayer = Player(score: 0, cards: [], playerName: "")

repeat  {
    print("There are \(Card.newDeck(aceValue: 1).count) in a deck of cards")
    print()
    game.newGame()
    var stringHitCard = ""
    gameOver = false
    currentScore = 0
repeat  {
    print(prompt)
    let playreResponse = readLine()
    
    switch playreResponse   {
    case "hit":
        let hitCard = game.hitMe()
        stringHitCard += (hitCard?.stringify() ?? "???") + " "
        print(stringHitCard , terminator: " ")
        currentScore = game.gameStatus(cardValueToAdd: hitCard?.value ?? 0)
        //print("score: \(currentScore)")
        
    case "pass":
        game.stopHits()
    default: print("Error")
    }
    
} while gameOver == false

print("Would you like to play again? (yes, no)")
playAgainResponse = readLine() ?? "no"
}   while playAgainResponse == "yes"
