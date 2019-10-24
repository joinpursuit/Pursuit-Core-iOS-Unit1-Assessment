//
//  Game.swift
//  BlackJack
//
//  Created by Ahad Islam on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {
    var deck: [Card]
    var player: Player
    var hitPlayer: Bool
    
    var hasMoreCards: Bool { return !deck.isEmpty }
    var randomComputerScore: Int { return
        Int.random(in: 1...30)}
    
    func newGame(_ aceValue: Int) {
        //resets game
        player.score = 0
        player.cards.removeAll()
        deck = Card.newDeck(aceValue: aceValue)
    }
    func choicePrompt()  {
        var prompt = false
        var choice = String()
        repeat {
            print("Do you want to hit or pass? (hit, pass)")
            let str = readLine() ?? ""
            guard str == "hit" || str == "pass" else {
                print("Not a valid option.")
                continue
            }
            choice = str
            prompt = true
        } while prompt == false
        if choice == "hit" {
            hitPlayer = true
        } else {
            self.hitPlayer = false
        }
    }
    func stopHits() {
        computerVsPlayer()
        //calls if user wishes to pass
    }
    func hitMe() {
        deck = deck.shuffled()
        guard let removedCard = deck.popLast() else {
            print("There are no cards in the deck.")
            return
        }
        player.cards.append(removedCard)
        player.score += removedCard.value
        gameStatus()
    }
    func computerVsPlayer() {
        //draws a random number for the computer and determines the winner of the game.
        let computerScore = randomComputerScore
        
        if computerScore > player.score && computerScore < 22 {
            print("The computer won BlackJack! Computer's score: \(computerScore) \(player.playerName.capitalized)'s score: \(player.score)")
        } else {
            print("You won! Computer's score: \(computerScore) \(player.playerName.capitalized)'s score: \(player.score)")
        }
    }
    func gameStatus() {
        //takes in player's card and determines the current score.
        //BlackJack, Bust, or Continue
        if player.score > 21 {
            print("BUST 👎😂😂😂")
        } else if player.score == 21 {
            print("🎉🎉🎉 BLACKJACK!!!!!! 🎉🎉🎉")
        } else {
            for card in self.player.cards {
                print("\(card.stringify()) ", terminator: "")
            }
            print(" score: \(player.score)")
            print()
        }
    }
    
    init(deck: [Card],
         player: Player,
         hitPlayer: Bool) {
        self.deck = deck
        self.hitPlayer = hitPlayer
        self.player = player
    }
}

