//
//  Game.swift
//  BlackJack
//
//  Created by Bienbenido Angeles on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {
    
    let blackJack = 21
    
    //instance properties
    var deck:[Card]
    var player:Player
    var hitPlayer:Bool
    
    //initializers
    init(deck: [Card], player:Player, hitPlayer:Bool) {
        self.deck = deck
        self.player = player
        self.hitPlayer = hitPlayer
    }

    //computed properties
    var hasMoreCards:Bool {
        return !deck.isEmpty
    }
    
    //get a value from the computer to be from the value of a random deck of cards
    var randomComputerScore:Int {
        deck = deck.shuffled()
        guard let computerCard = deck.popLast()?.value else { return Int.random(in: 15...21) }
        return computerCard
    }
    
    //methods
    func newGame () {
        deck = Card.newDeck(aceValue: 11)
        player = Player(score: 0, cards: [], playerName: "")
        hitPlayer = false
    }
    
    func stopHits () {
        hitPlayer = false
        computerVsPlayer()
    }
    
    func hitMe() -> Card {
        deck = deck.shuffled()
        guard let playerCard = deck.popLast() else {
            return deck[Int.random(in: 1...52)]
        }
        return playerCard
    }
    
    //computers perspective
    func computerVsPlayer() {
        let playerScore = self.player.score
        let computerScore = randomComputerScore
        
        if playerScore > computerScore{
            print("You won. \(player.playerName): \(playerScore) Computer: \(computerScore)")
        } else if playerScore < computerScore{
            print("Computer Won. \(player.playerName): \(playerScore) Computer: \(computerScore)")
        } else if computerScore == blackJack {
            print("Computer wins with BLACKJACK!!! \(player.playerName): \(playerScore) Computer: \(computerScore)")
        } else if playerScore == computerScore {
            print("Game is tied.")
        }
    }
    
    //TODO: Convert parameters to accept [Card] or the hand of the users Cards
    func gameStatus (playerInputCard hitCard: Card) -> Bool {
        
        //players current hand
        var playerHand = self.player.cards
        
        //add the hitted card to the players hand
        playerHand.append(hitCard)
        
        //players current score - should be zero,but is given from the initialized player.score in the main.swift file
        var playerCurrentScore = self.player.score
        
        //for loop to access the value of each card in the players hand, and sum them up
        for card in playerHand {
            playerCurrentScore += card.value
        }
        self.player.score = playerCurrentScore
        
        if playerCurrentScore == blackJack {
            print("BLACKJACK")
            return false
        } else if playerCurrentScore > blackJack {
            print("BUST")
            return false
        } else {
            return true
        }
            
    }
    
}
