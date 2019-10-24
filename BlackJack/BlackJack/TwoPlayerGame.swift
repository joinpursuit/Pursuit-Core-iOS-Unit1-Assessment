//
//  TwoPlayerGame.swift
//  BlackJack
//
//  Created by Cameron Rivera on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct TwoPlayerGame{
    // MARK: Stored Properties of Game
    private var deck: [Card]
    private var player1: Player
    private var player2: Player
    private var hitPlayer: Bool
    
    //MARK: Computed Properties of Game
    private var hasMoreCards: Bool {
        get {
            return !deck.isEmpty
        }
    }
    private var randomComputerScore: Int {
        get {
            return Int.random(in: 18...21)
        }
    }
    
    //MARK: Initializer of Game
    init(deck: [Card], player1: Player, player2: Player, hitPlayer: Bool){
        self.deck = deck
        self.player1 = player1
        self.player2 = player2
        self.hitPlayer = hitPlayer
    }
    
    //MARK: Helper Methods of Game
    
    func PlayerVsPlayer(_ currentPlayer: Int){
        printScore(currentPlayer)
        print()
        
        if player1.getScore() > player2.getScore(){
            if player1.getScore() == 21{
                print("Player1 wins with BlackJack!!!")
            } else{
            print("Player1 wins!")
            }
        }else if player1.getScore() < player2.getScore(){
            if player2.getScore() == 21{
                print("Player2 wins with BlackJack!!!")
            } else{
            print("Player2 wins!")
            }
        }else if player1.getScore() == player2.getScore(){
            print("It is a tie.")
        }
        print("Player1's Score: \(player1.getScore()), Player2's Score: \(player2.getScore())")
    }
    
    func printScore(_ currentPlayer: Int){
        if currentPlayer == 1{
            for element in player1.getCards(){
                if let FaceCard = element.face{
                    print("\(FaceCard.rawValue)\(element.suit.rawValue)", terminator: " ")
                } else {
                    print("\(element.value)\(element.suit.rawValue)", terminator: " ")
                }
            }
        } else {
            for element in player2.getCards(){
                if let FaceCard = element.face{
                    print("\(FaceCard.rawValue)\(element.suit.rawValue)", terminator: " ")
                } else {
                    print("\(element.value)\(element.suit.rawValue)", terminator: " ")
                }
            }
        }
    }
    
    
    //MARK: Other Methods of Game
    mutating func newGame(){
        self.deck = Card.newDeck(aceValue: 11)
        self.player1 = Player(score: 0, cards: [], playerName: "")
        self.player2 = Player(score: 0, cards: [], playerName: "")
        self.hitPlayer = false
    }
    
    
    mutating func stopHits(_ currentPlayer: Int) -> Bool{
        self.hitPlayer = true
        return self.hitPlayer
    }
    
    mutating func hitMe() -> Card?{
        self.deck = self.deck.shuffled()
        return deck.popLast()
    }
    
    mutating func gameStatus(_ newCard: Card, _ currentPlayer: Int) -> Bool{
        
        if currentPlayer == 1{
            player1.addCard(newCard)
            var playerScore: Int = 0
            for card in player1.getCards(){
                playerScore += card.value
            }
            player1.setScore(playerScore)
            
            printScore(currentPlayer)
            print("Player\(currentPlayer)'s score \(player1.getScore())")
            
            if player1.getScore() == 21 {
                print("BLACK JACK!!! Player1 wins!!!")
                print("Player2 loses with a score of \(player2.getScore())")
                return false
            } else if player1.getScore() > 21{
                print("BUST. Player2 wins with a score of \(player2.getScore())!")
                print("Player1 loses with a score of \(player1.getScore())")
                return false
            }
            return true
        } else {
            player2.addCard(newCard)
            var playerScore: Int = 0
            for card in player2.getCards(){
                playerScore += card.value
            }
            player2.setScore(playerScore)
            
            printScore(currentPlayer)
            print("Player\(currentPlayer)'s score \(player2.getScore())")
            
            if player2.getScore() == 21 {
                print("BLACK JACK!!! Player2 wins!!!")
                print("Player1 loses with a score of \(player1.getScore())")
                return false
            } else if player2.getScore() > 21{
                print("BUST. Player1 winds with a score of \(player1.getScore())!")
                print("Player2 loses with a score of \(player2.getScore())")
                return false
            }
            return true
        }
    }

    
    //MARK: Accessors of Game
    func getDeck() -> [Card]{
        return self.deck
    }
    
    func getPlayer1() -> Player{
        return self.player1
    }
    
    func getPlayer2() -> Player{
        return self.player2
    }
    
    func getHitPlayer() -> Bool{
        return hitPlayer
    }
    
    
    //MARK: Mutators of Game
    mutating func setDeck(_ newDeck: [Card]){
        self.deck = newDeck
    }
    
    mutating func setPlayer1(_ newPlayer: Player){
        self.player1 = newPlayer
    }
    
    mutating func setPlayer2(_ newPlayer: Player){
        self.player2 = newPlayer
    }
    
    mutating func setHitPlayer(_ newHit: Bool){
        self.hitPlayer = newHit
    }
}

