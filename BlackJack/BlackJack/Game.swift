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
        guard let computerCard = deck.popLast()?.value else { return Int.random(in: 12...21) }
        return computerCard
    }
    
    //methods
    func newGame () {
        deck.removeAll()
        player.cards.removeAll()
        player.score = 0
        player.playerName = ""
        hitPlayer = true
    }
    
    func stopHits () {
        computerVsPlayer(inputInt: randomComputerScore)
    }
    
    func hitMe() -> Card {
        deck = deck.shuffled()
        guard let playerCard = deck.popLast() else { return deck[Int.random(in: 1...Card.newDeck(aceValue: 1).count)]}
        //var playerCards = player.cards.append(playerCard)
        return playerCard
    }
    
    func computerVsPlayer(inputInt computerScore: Int) {
        //let computerScore = randomComputerScore
        let playerScore = player.score
        
        if playerScore > computerScore{
            print("You won. You: \(playerScore) Computer: \(computerScore)")
        } else if playerScore < computerScore{
            print("Computer Won. You: \(playerScore) Computer: \(computerScore)")
        } else if playerScore == blackJack{
            print("BLACKJACK!!! YOU WON!!!")
        } else if computerScore == blackJack {
            print("Computer wins with BLACKJACK!!! You: \(playerScore) Computer: \(computerScore)")
        } else if playerScore == blackJack && computerScore == blackJack {
            print("Game is tied. Both players have BLACKJACK!!!")
        }
    }
    
    func gameStatus (playerInputCard playerCard: Card) {
        
        //var truOfalse:Bool
        
        var playerCurrentScore = player.score
        let playerScore = playerCard.value
        playerCurrentScore += playerScore
        
        switch hitPlayer {
        case playerCurrentScore == blackJack:
            print("BLACKJACK")
            hitPlayer = false
        case playerCurrentScore < blackJack:
            print("CONTINUE")
            hitPlayer = true
        case playerCurrentScore > blackJack:
            print("BUST")
            hitPlayer = false
        default:
            break
        }
    }
    
}
