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
    
    //function theoretically not needed as the deck will likely never be empty on one player mode. Possibly so on 2-player mode
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
    
    //uses a card that is hit and added to the players hand to determine if the status of the game should continue
    func gameStatus (playerInputCard hitCard: Card) -> Bool {
        
        //players current hand
        var playerHand = self.player.cards
        
        //add the hitted card to the players hand
        playerHand.append(hitCard)
        
        //players current score - should be zero,but is given from the initialized player.score in the main.swift file
        var playerCurrentScore = 0
        
        //for loop to access the value of each card in the players hand, and sum them up
        for card in playerHand {
            playerCurrentScore += card.value
        }
        
        // stores a given card value back to the game's instance of the score property of player
        self.player.score = playerCurrentScore
        
        if playerCurrentScore == blackJack {
            print("BLACKJACK")
            self.hitPlayer = false
            return self.hitPlayer
        } else if playerCurrentScore > blackJack {
            print("BUST")
            self.hitPlayer = false
            return self.hitPlayer
        }
        
        //else statement where if the player's score is then blackjack, they can still hit until either of the above conditions are true
        else {
            self.hitPlayer = true
            return self.hitPlayer
        }
            
    }
    
}
