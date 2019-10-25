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
    var player = Player(score: 0, playerCards: [Card]())
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
        player = Player(score: 0, playerCards: [Card]())
        deck = Card.newDeck(aceValue: 1)
    }
    
    //2.
    //if pass, computer score is generated at a random number in a range
    func stopHits() {
        print("computer score:\(computerVPlayer())")
        
        
    }
    
    //3.
    //if hit me, card is removed from deck and added to player's hand.
    func hitMe() -> Card? { //userResponse: String, hit: Bool
        var card: Card?
        deck = deck.shuffled()
        if let hitCard = deck.popLast() {
            player.score += hitCard.value
            player.playersCards.append(hitCard)
            card = hitCard
            let _ = gameStatus(card: hitCard)
        }
        let playerHand = player.playersCards.map { (card) -> String in
            card.stringify()
        }
        print(playerHand)
        return card
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
    func gameStatus(card: Card) -> Int {
        
                
        if player.score == 21 {
            print("BlackJack! You won! 🥳")
        }
        else if player.score > 21 {
            print("BUST! You Lost 😢")
        }
        return player.score
        
//
//        repeat{
//            let userResponse = readLine() ?? ""
//            switch userResponse {
//            case "hit" :
//                let _ = hitMe()
//                print("player's score: \(player.score)")
//            case "pass" :
//                stopHits()
//                break
//            default :
//                print("?")
//            }
//        } while player.score < 21
//
//        if player.score == 21 {
//            print("BlackJack! You won! 🥳")
//        }
//        if player.score < computerVPlayer() {
//            print("BUST! You Lost 😢")
//        }
//        return player.score
    }
    
    
    
    
    
    
    
    
    //ends class
}







