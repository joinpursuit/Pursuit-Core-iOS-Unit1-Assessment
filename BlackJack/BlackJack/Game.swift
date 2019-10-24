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
    var player = Player(score: 0, playersCards: [])
    var hitPlayer = true
    var score = 0
    
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
        score = 0
        _ = hasMoreCards == true
        deck = [Card]()
        player = Player(score: 0, playersCards: [])
    }
    
    //2.
    //if pass, computer score is generated at a random number in a range
    //    mutating func stopHits(userResponse: String) -> Bool {
    //        switch userResponse {
    //        case false:
    //            if hitPlayer == false {
    //            let result = computerVPlayer(compScore: randomComputerScore)
    //            print("computer scored: \(result)")
    //            }
    //        default:
    //            print("not valid")
    //    }
    
    //3.
    //if hit me, card is removed from deck and added to player's hand.
    mutating func hitMe(userResponse: String) -> Bool {
        switch userResponse {
        case "hit" :
        hitPlayer == true
        for (index, card) in deck.enumerated() {
            player.playersCards.append(card)
            deck.remove(at: index)
        }
        case "pass" :
        hitPlayer == false
        computerVPlayer(compScore: randomComputerScore)
        default:
        print("Sorry the deck is empty")
    }
    }
    
    //4.
    //calculating computer score by randomly choosing from a range of numbers.
    func computerVPlayer(compScore: Int) -> Int {
        let computerScore = randomComputerScore
        return computerScore
    }
    
    //5.
    //comparing player's score with computer's score.
    //choices to continue, bust/lose, blackjack/win
    mutating func gameStatus(userResponse: String) {
        score = player.playerScore(playersHand: player.playersCards)
        print("score: \(score)")
        
        switch userResponse {
        case "hit":
            hitMe(hitPlayer: true)
        case "pass":
            stopHits(hitPlayer: false)
        default:
            print("Not valid. hit or pass")
        }
        
        if score > computerVPlayer(compScore: randomComputerScore) {
            print("BlackJack!")
            print("You Won!! 🥳")
        } else if score == computerVPlayer(compScore: randomComputerScore) {
            print("It's a tie! 😅")
        } else {
            print("You lost 😢")
        }
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
