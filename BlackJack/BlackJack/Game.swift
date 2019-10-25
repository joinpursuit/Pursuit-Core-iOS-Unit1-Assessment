//
//  Game.swift
//  BlackJack
//
//  Created by Gregory Keeley on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {
    static var deck = Card.newDeck(aceValue: 1)
    static var player1 = Player.init()
    static var player2 = Player.init()
    static var hitPlayer = Bool()
    static var multiplayer = false
    
    var player1currentCards = String().description
    var player2currentCards = String().description
    var shuffledDeck = Game.deck.shuffled()
    
    var player1Name = Game.player1.player1Name
    var player2Name = Game.player2.player2Name
    var player1Score = 0
    var player2Score = 0
    var computerScore = Int.random(in: (17...21))
    
    var hasMoreCards: Bool {
        return !Game.deck.isEmpty
    }
    func player1HitOrPass() {
        print("\n\(player1Name), would you like to hit or pass? (hit, pass)")
    }
    func player2HitOrPass() {
        print("\n\(player2Name), would you like to hit or pass? (hit, pass)")
    }
    func newGame() {
        Game.deck = Card.newDeck(aceValue: 1)
        player1Score = 0
        player1currentCards.removeAll()
        shuffledDeck = Game.deck.shuffled()
    }
    func hitMe() {
        let randomCard = shuffledDeck.first
        player1Score += (randomCard?.value ?? 0)
        player1currentCards.append(randomCard?.stringify() ?? "")
        player1currentCards.append(" ")
        print("\n\n\(player1currentCards)\n")
        print("Score: \(player1Score)\n")
        shuffledDeck.removeFirst()
        
        if player1Score == 21 {
            print("Black Jack! You win!")
        }
        if player1Score >= 22 {
            print("Bust! You lose!")
        }
        if hasMoreCards == false {
            print("The deck is empty, would you like to start over?")
        }
    }
    func hitMePlayer1() {
        let randomCard = shuffledDeck.first
        player1Score += (randomCard?.value ?? 0)
        player1currentCards.append(randomCard?.stringify() ?? "")
        player1currentCards.append(" ")
//        print("\n\n\(player1currentCards)\n")
//        print("\(player1Name) Score: \(player1Score)")
//        print("\(player2Name) Score: \(player2Score)\n")
        shuffledDeck.removeFirst()
        
        //        if player1Score == 21 {
        //            print("Black Jack! \(Game.player1.player1Name) wins!")
        //        }
        //        if player1Score >= 22 {
        //            print("Bust!\(Game.player1.player1Name) lost!")
        //        }
        if hasMoreCards == false {
            print("The deck is empty, would you like to start over?")
        }
    }
    func hitMePlayer2() {
        let randomCard = shuffledDeck.first
        player2Score += (randomCard?.value ?? 0)
        player2currentCards.append(randomCard?.stringify() ?? "")
        player2currentCards.append(" ")
//        print("\n\n\(player2currentCards)\n")
//        print("\(player1Name) Score: \(player1Score)")
//        print("\(player2Name) Score: \(player2Score)\n")
        shuffledDeck.removeFirst()
        
        //        if player2Score == 21 {
        //            print("Black Jack! \(Game.player2.player1Name) wins!")
        //        }
        //        if player2Score >= 22 {
        //           print("Bust!\(Game.player2.player1Name) lost!")
        //        }
        if hasMoreCards == false {
            print("The deck is empty, would you like to start over?")
        }
    }
    func player1VSplayer2() {
        if player1Score == player2Score {
            print("Its a tie!")
        } else if player1Score > player2Score {
            print("\(player1Name) WINS!!")
        } else if player1Score < player2Score {
            print("\(player2Name) WINS!!")
            print("""
                \(player1Name) Score:\(player1Score)
                \(player2Name) Score:\(player2Score)
                """)
        }
    }
    
    func computerVsPlayer() {
        if computerScore > player1Score {
            print()
            print("\(player1Name) score: \(player1Score) Computer score: \(computerScore)")
            print()
            print("You lost!")
        } else {
            print()
            print("\(player1Name) score: \(player1Score) Computer score: \(computerScore)")
            print()
            print("You won!")
        }
    }
    func howManyPlayers () {
        print("How many players? (1, 2)")
        let amountOfPlayers = readLine() ?? "1"
        if amountOfPlayers == "1" {
            print("Please enter player name:")
            setPlayer1Name()
            Game.multiplayer = false
        } else if amountOfPlayers == "2" {
            print("Please enter player 1 name:")
            setPlayer1Name()
            print("Please enter player 2 name:")
            setPlayer2Name()
            Game.multiplayer = true
        }
    }
    func setPlayer1Name() {
        player1Name = readLine() ?? "Player 1"
    }
    func setPlayer2Name() {
        player2Name = readLine() ?? "Player 2"
    }
}


