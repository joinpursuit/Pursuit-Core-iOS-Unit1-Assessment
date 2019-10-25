//
//  Game.swift
//  BlackJack
//
//  Created by Ian Bailey on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
var computerScore = 0
class Game {
    var deck =  [Card]()
    var player = Player(score: 0, cards: [], playerName: "Ian")
    var hitPlayer = true
    
    var hasMoreCards: Bool {
        return !deck.isEmpty
    }
    var randomComputerScore: Int {
        let computerCardPicked = deck.popLast()
        computerScore += computerCardPicked?.value ?? 7
        return computerScore
    }
    
    func newGame() -> [Card] {
        let aceValue = [1,11]
        player.score = 0
        computerScore = 0
        let newDeck = Card.newDeck(aceValue: aceValue.randomElement() ?? 5)
        deck = newDeck.shuffled()
        return deck
        
    }
    

    func hitMe() -> Card? {
        guard let pickedCard = deck.popLast() else {return nil}
        player.score += pickedCard.value
        player.cards.append(pickedCard)
        guard let computerCard = deck.popLast() else {return nil}
        computerScore += computerCard.value
        print("comp score is \(computerScore)")
        return pickedCard
        }
       
    func gameStatus() {
        if player.score == 21 && computerScore != 21 {
            print("BLACKJACK! YOU WIN!")
            gameOver = true
        }
        if player.score != 21 && computerScore == 21 {
            print("COMPUTER BLACKJACK! YOU LOSE!")
            gameOver = true
        }
        if player.score > 21 && computerScore < 21 {
            print("PLAYER BUST! YOU LOSE!")
            gameOver = true
        }
        if player.score < 21 && computerScore > 21 {
            print("COMPUTER BUST! YOU WIN!")
            gameOver = true
        }
        if player.score < 21 && computerScore < 21 {
            gameOver = false
        }
        if player.score == 21 && computerScore == 21 {
            print("TIE GOES TO THE DEALER! YOU LOSE")
            gameOver = true
        }
    }
        
    func stopHits() {
        computerScore += deck.popLast()?.value ?? 5
        if computerScore.distance(to: 21) > player.score.distance(to: 21) && player.score <= 21 && computerScore <= 21 {
            print("\(player.score) player and \(computerScore) computer")
            print("YOU ARE CLOSEST WITHOUT GOING OVER! YOU WIN!")
            gameOver = true
        } else if computerScore > 21 {
            print("\(player.score) player and \(computerScore) computer")
            print("YOU ARE CLOSEST WITHOUT GOING OVER! YOU WIN!")
            gameOver = true
        } else {
           print("\(player.score) player and \(computerScore) computer")
            print("You Lose")
            gameOver = true
        }
    }
    
    
    
    
    
    }
 
