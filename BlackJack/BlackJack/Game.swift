//
//  Game.swift
//  BlackJack
//
//  Created by casandra grullon on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct Game {
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
    mutating func newGame() {
        player = Player(score: 0, playersCards: [Card]())
        deck = Card.newDeck(aceValue: 1)
        _ = hasMoreCards
        player = Player(score: 0, playersCards: [])
    }
    
    //2.
    //if pass, computer score is generated at a random number in a range
    mutating func stopHits(userResponse: String) {
            if userResponse == "pass" {
            print("computer score:\(computerVPlayer())")
            }
        }
    
    //3.
    //if hit me, card is removed from deck and added to player's hand.
    mutating func hitMe(userResponse: String) -> [Card] { //userResponse: String, hit: Bool
        if userResponse == "hit" {
            deck = deck.shuffled()
            if let hitCard = deck.popLast() {
            player.playersCards.append(hitCard)
            }
        }
        print(player.playersCards)
        for card in player.playersCards {
            print(card.stringify())
        }
        
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
    mutating func gameStatus() {
        let playerHand = player.playersCards
        let score = player.playerScore()
        print("your hand: \(playerHand)")
        print("your score: \(String(score))")
        
        if score == 21 {
            print("BlackJack!")
            print("You Won! 🥳")
        } else if score < 21 {
            print(String(score))
            print(playerHand)
            print("Wanna keep going? Hit or pass")
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
        
//        switch stats {
//        case "hit" :
//            _ = hitMe(userResponse: userResponse)
//            print("your score: \(String(score))")
//            print("your hand: \(playerHand)")
//            if score > computerVPlayer() {
//                print("BlackJack!")
//                print("You Won!! 🥳")
//            } else if score == computerVPlayer() {
//                print("It's a tie! 😅")
//            } else {
//                print("You lost 😢")
//            }
//        case "pass" :
//            _ = hitMe(userResponse: userResponse)
//            print("your score: \(String(score))")
//            print("computer score: \(computerVPlayer())")
//            if score > computerVPlayer() {
//                          print("BlackJack!")
//                          print("You Won!! 🥳")
//                      } else if score == computerVPlayer() {
//                          print("It's a tie! 😅")
//                      } else {
//                          print("You lost 😢")
//                      }
//        default :
//            print("not valid")
//        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
}


//class Game {
//    //MARK: properties
//    var deck = [Card]()
//    var player : Player
//    var hitPlayer : Bool
//    var score : Int
//
//    //computed properties
//    var hasMoreCards : Bool {
//        return !deck.isEmpty
//    }
//
//    var randomComputerScore : Int {
//        return Int.random(in: 17...21)
//    }
//    //initializers
//    init(deck: [Card],
//         player: Player,
//         hitPlayer: Bool,
//         score: Int) {
//        self.deck = deck
//        self.player = player
//        self.hitPlayer = hitPlayer
//        self.score = score
//    }
//
//    //MARK: methods
//
//    //1.
//    func newGame() {
//        score = 0
//    }
//
//    //2.
//    //if pass, computer score is generated at a random number in a range
//    func stopHits(hitPlayer: Bool){
//        switch hitPlayer {
//        case false:
//            let result = computerVPlayer(compScore: randomComputerScore)
//            print("computer scored: \(result)")
//        default:
//            print("not valid")
//        }
//    }
//
//    //3.
//    //if hit me, card is removed from deck and added to player's hand.
//    func hitMe(hitPlayer: Bool) {
//        switch hasMoreCards {
//        case true :
//            if hitPlayer == true {
//                for (index, card) in deck.enumerated() {
//                    player.playersCards.append(card)
//                    deck.remove(at: index)
//                }
//            }
//        default:
//            print("Sorry the deck is empty")
//
//        }
//    }
//
//    //4.
//    //calculating computer score by randomly choosing from a range of numbers.
//    func computerVPlayer(compScore: Int) -> Int {
//        let computerScore = randomComputerScore
//        return computerScore
//    }
//
//    //5.
//    //comparing player's score with computer's score.
//    //choices to continue, bust/lose, blackjack/win
//    func gameStatus(userResponse: String) {
//        score = player.playerScore(playersHand: player.playersCards)
//        print("score: \(score)")
//
//        switch userResponse {
//        case "hit":
//            hitMe(hitPlayer: true)
//        case "pass":
//            stopHits(hitPlayer: false)
//        default:
//            print("Not valid. hit or pass")
//        }
//
//        if score > computerVPlayer(compScore: randomComputerScore) {
//            print("BlackJack!")
//            print("You Won!! 🥳")
//        } else if score == computerVPlayer(compScore: randomComputerScore) {
//            print("It's a tie! 😅")
//        } else {
//            print("You lost 😢")
//        }
//    }
//
//
//
//
//
//
//
//
//
//
//}
//
//
