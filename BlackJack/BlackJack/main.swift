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

// created instances of objects relevant toward the creation of the game like Player and Card
//var deckOfCards = Card.newDeck(aceValue: 11)
//var player = Player(score: 0, cards: [], playerName: userName)
let game = Game(deck: Card.newDeck(aceValue: 11), player: Player(score: 0, cards: [], playerName: ""), hitPlayer: false)
//game.newGame()

var gameOver = false
var continueGame = true
let userPrompt = "Do you want to hit or pass? (hit, pass)"

repeat {
    //prompt to get user name
    print("WELCOME TO BLACKJACK \n What is your name?")
    let userName = getUserInput()
    game.player.playerName = userName
    //start of inner repeat while
    repeat {
        print(userPrompt)
        let userHitOrPassResponse = getUserInput()
        //var playerHand = game.player.cards
        //control flow of whether or not user response with a hit or pass response
        
        // if user hits card will be given to the user
        if userHitOrPassResponse == "hit" {
            let userCard = game.hitMe()
            continueGame = game.gameStatus(playerInputCard: userCard)
            //playerHand.append(userCard)

            //prints what the user sees
            var score = game.player.score
            var userCardString = String()
            userCardString += userCard.stringify() + " "
            score += userCard.value
            
            print(userCardString, "score: \(score)")
        } else if userHitOrPassResponse == "pass" {
            // returns whether or not the user won the game
            game.stopHits()
            continueGame = false
        }
    } while continueGame
    //end of inner repeat while
    
    
    // prompt the user whether or not they want to keep playing
    print("Do you wish to continue playing? (yes, no)")
    let userContinue = getUserInput()
    if userContinue == "yes" {
    game.newGame()
      gameOver = true
    } else if userContinue == "no" {
      gameOver = false
    }
} while gameOver
