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
        _ = hasMoreCards
    }
    
    //2.
    //if pass, computer score is generated at a random number in a range
    func stopHits() {

            print("computer score:\(computerVPlayer())")

    }
    
    //3.
    //if hit me, card is removed from deck and added to player's hand.
    func hitMe() { //userResponse: String, hit: Bool
            deck = deck.shuffled()
            if let hitCard = deck.popLast() {
                player.playersCards.append(hitCard)
            }
            let playerHand = player.playersCards.map { (Card) -> String in
                Card.stringify()
            }
            print(playerHand)
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
        let score = player.playerScore()

        if score == 21 {
            print("BlackJack! You won!🥳")
            print("your score: \(score)")
        } else if score < 21 {
            print("your score: \(score)")
            let userResponse = readLine() ?? ""
            switch userResponse {
            case "hit" :
                hitMe()
                print("your score: \(score)")
            case "pass" :
                stopHits()
                print("your score: \(score)")
            default :
                print("not valid")
            }
        } else if score < computerVPlayer() {
            print("BUST! \nYou lost! 😢")

        } else if score == computerVPlayer() {
            print("It's a tie! 😅")
        } else {
            print("?")
        }
}
    

}
