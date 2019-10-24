//
//  Game.swift
//  BlackJack
//
//  Created by Amy Alsaydi on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {
    //MARK: Properties:
    
    // instance properties
    var deck = [Card]()
    var player = Player(score: 0, cards: [Card](), playerName: "No Name")
    var hitPlayer = false
    
    var dealtCards = [String]()

    // computed properties
    var hasMoreCards: Bool {
        return !deck.isEmpty // returns false if deck is empty
    }
    var randomComputerScore: Int { // returns random int 18 - 21
        return Int.random(in: 18 ... 21)
    }
    
    //MARK: Methods:
    
    func newGame() {
        player.score = 0
        deck.removeAll()
    }
    
    func stopHits() {
        computerVsPlayer()
    }
    
    func hitMe() {
        // var dealtCards = [String]()
        if let randomCard = Card.newDeck(aceValue: 1).randomElement(){
            dealtCards.append(randomCard.stringify())

            // incrementing score
            player.score += randomCard.value
            print("\(dealtCards.joined(separator:" ")) score: \(player.score)")
            
        }
    }
    
    func computerVsPlayer() {
        let computerScore = randomComputerScore
        let userScore = player.score
        
        if userScore > computerScore {
            print("BLACKJACK!! YOU WON! Computer: \(computerScore), You: \(userScore). ")
        } else if userScore < computerScore {
            print("COMPUTER WINS Computer: \(computerScore), You: \(userScore).")

        } else  if userScore == computerScore{
            print("ITS A TIE")
        }
        // either on works it just repeated becasuse i called function twice
        
//        switch userScore {
//        case let user where user > computerScore:
//            print("BLACKJACK!! YOU WON! Computer: \(computerScore), You: \(user). ")
//        case let user where user < computerScore:
//            print("COMPUTER WINS Computer: \(computerScore), You: \(user).")
//        default:
//            print("ITS A TIE")
//
//        }
    }
    
    func gameStatus() {
        // player.score += card.value
        if player.score == 21 {
            print("BlackJack!")
        } else if player.score > 21 {
            print("BUST!")
        } 
    }
    
}


