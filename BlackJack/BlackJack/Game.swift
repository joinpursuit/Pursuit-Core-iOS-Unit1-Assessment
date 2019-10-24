//
//  Game.swift
//  BlackJack
//
//  Created by Howard Chang on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
final class Game {
    var deck = [Card]()
    var player: Player = Player(playerName: "")
    var hitPlayer: Bool = true
    private var hasMoreCards: Bool {
        return !deck.isEmpty
    }
    private var randomComputerScore: Int {
        return (17...21).randomElement()!
    }
    private func newGame() {
        deck.removeAll()
        player.cards.removeAll()
        player.score = 0
    }
    
    private func stopHits() {
        let computerScore = self.randomComputerScore
        if player.score > computerScore {
            print("Dealer got \(computerScore), \(player.playerName) Wins!")
            playAgain()
        } else if player.score == computerScore {
            print("Tie! No One Wins")
            playAgain()
        } else {
            print("Dealer got \(computerScore), Dealer Wins!")
            playAgain()
        }
    }
    
    func hitMe() {
        if hasMoreCards == true {
            deck = deck.shuffled()
            let newCard = deck.popLast()!
            player.cards.append(newCard)
        }
        showHand()
    }
    
    private func gameStatus() -> Int {
        var score = 0
        for each in player.cards {
            score += each.value
            player.score = score
        }
        return score
    }
    
    func hitChoice() {
        guard game.player.score != 21 else {
            print("\(game.player.playerName) Wins!")
            hitPlayer = false
            return playAgain()
        }
        guard game.player.score < 22 else {
            print("\(player.playerName) has busted. Good Game")
            hitPlayer = false
            return playAgain()
        }
        print("Do you want to hit or pass (Enter hit or pass)")
        let choice = readLine()!.lowercased()
        guard choice == "hit" || choice == "pass" else {
            return hitChoice()
        }
        switch choice {
        case "hit":
            hitMe()
        case "pass":
            game.hitPlayer = false
            stopHits()
        default:
            game.hitPlayer = false
            stopHits()
        }
    }
    
    private func showHand() {
        for card in player.cards {
            print("\(card.stringify())", terminator: " ")
        }
        print("Score: \(game.gameStatus())")
    }
    
    private func playAgain() {
        print("Do you want to play again? Enter yes for new game")
        let answer = readLine()!.lowercased()
        if answer == "yes" || answer == "y" {
            newGame()
            gameContinue = true
        } else {
            print("GoodBye")
            gameContinue = false
        }
    }
}
