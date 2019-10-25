//
//  Game.swift
//  BlackJack
//
//  Created by Juan Ceballos on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game  {
    var deck: [Card] = []
    var player = Player(score: 0, cards: [], playerName: "")
    var hitPlayer = Bool()
    
    var hasMoreCards: Bool    {
        return !deck.isEmpty
    }
    var randomComputerScore: Int    {
        let computerScore = Int.random(in: 16...21)
        return computerScore
    }
    
    func newGame()  {
        deck = Card.newDeck(aceValue: 11)
        player = Player(score: 0, cards: [], playerName: "")
        hitPlayer = Bool()
    }
    
    func stopHits() {
        
        /*stopHits() called if the user wishes to pass their turn. In that case the computer draws a random number and a winner is chosen between the computer's score and the player's score.*/
        computerVsPlayer()
        
    }
    
    func hitMe() -> Card?   {
        //called as the user requests more cards from the deck
        var playersCard = deck.shuffled()
        let chosenCard = playersCard.popLast()
        return chosenCard
    }
    
    func computerVsPlayer() {
        //draws a random number for the computer and determines the winner of the game.
        let computerScore = randomComputerScore
        if computerScore > currentScore {
            print("Computer wins! Computer: \(computerScore) and You: \(currentScore)")
            gameOver = true
        }
        else if computerScore == currentScore   {
            print("Tie, how boring...Tie at: \(currentScore)")
            gameOver = true
        }
        else    {print("Hooray! You Win! Computer: \(computerScore) and You: \(currentScore)")
                gameOver = true
        }
    }
    
    func gameStatus(cardValueToAdd : Int) -> Int  {
        
        /*takes in the player's card and determines the current score. Here the player score options can be, BlackJack, Bust or Continue playing as their status is still valid for game play.*/
        player.score += cardValueToAdd
        currentScore = player.score
        
        
        if currentScore > 21    {
            print("score: \(currentScore)")
            print("BUST!!!")
            gameOver = true
        }
        else if currentScore == 21   {
            print("score: \(currentScore)")
            print("BlackJack! You Won!")
            gameOver = true
        }
        else {print("score: \(currentScore)")}
        
        
        return currentScore
    }
}

