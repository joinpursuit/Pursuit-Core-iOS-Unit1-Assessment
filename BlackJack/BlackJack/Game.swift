//
//  Game.swift
//  BlackJack
//
//  Created by casandra grullon on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {
    //MARK: properties
    var deck = [Card]()
    var player = Player(score: 0, playersCards: [Card]())
    var hitPlayer = false
    
    //computed properties
    var hasMoreCards : Bool {
        return !deck.isEmpty
    }
    
    var randomComputerScore : Int {
        return Int.random(in: 17...21)
    }
    
    //MARK: methods
    
    //1.
    func newGame() {
        player = Player(score: 0, playersCards: [Card]())
        deck = Card.newDeck(aceValue: 1)
        _ = hasMoreCards
        player = Player(score: 0, playersCards: [])
    }
    
    //2.
    //if pass, computer score is generated at a random number in a range
    func stopHits(userResponse: String) {
            if userResponse == "pass" {
            print("computer score:\(computerVPlayer())")
            }
        }
    
    //3.
    //if hit me, card is removed from deck and added to player's hand.
    func hitMe(userResponse: String) -> [Card] { //userResponse: String, hit: Bool
        if userResponse == "hit" {
            deck = deck.shuffled()
            if let hitCard = deck.popLast() {
                player.playersCards.append(hitCard)
            }
        }
//        print(player.playersCards)
//        for card in player.playersCards {
//            print(card.stringify())
//        }
        
        return player.playersCards
    }
    
    //4.
    //calculating computer score by randomly choosing from a range of numbers.
    func computerVPlayer() -> Int {
        let computerScore = randomComputerScore
        return computerScore
    }
    //5.
    //comparing player's score with computer's score.
    //choices to continue, bust/lose, blackjack/win
    func gameStatus() {
        let playerHand = player.playersCards
        let score = player.playerScore()
        
        if score == 21 {
            print("BlackJack!")
            print("You Won! 🥳")
        } else if score < 21 {
            print(String(score))
            print(playerHand)
            print("Hit or pass")
            switch hitPlayer {
            case true :
                hitMe(userResponse: "")
            case false :
                stopHits(userResponse: "")
            default :
                print("?")
            }
        } else if score < computerVPlayer() {
            print("You lost! 😢")
        } else if score == computerVPlayer() {
            print("It's a tie! 😅")
        } else {
            print("?")
        }
    
