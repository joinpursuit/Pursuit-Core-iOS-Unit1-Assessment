//
//  Game.swift
//  BlackJack
//
//  Created by Cameron Rivera on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct Game{
    // MARK: Stored Properties of Game
    private var deck: [Card]
    private var player: Player
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
    init(deck: [Card], player: Player, hitPlayer: Bool){
        self.deck = deck
        self.player = player
        self.hitPlayer = hitPlayer
    }
    
    //MARK: Helper Methods of Game
    
    func computerVsPlayer(){
        let compScore = self.randomComputerScore
        printScore()
        print()
        if compScore > self.player.getScore(){
            if compScore == 21{
                print("The computer wins with BlackJack!!!")
            } else{
            print("The computer wins.")
            }
        }else if compScore < self.player.getScore(){
            print("You have won. Though it was difficult, you have managed to defeat the computer. This is a big win for humans everywhere.")
        }else if compScore == self.player.getScore(){
            print("It is a tie.")
        }
        print("Computer's Score: \(compScore), Your Score: \(self.player.getScore())")
    }
    
    func printScore(){
        for element in self.player.getCards(){
            if let FaceCard = element.face{
                print("\(FaceCard.rawValue)\(element.suit.rawValue)", terminator: " ")
            } else {
                print("\(element.value)\(element.suit.rawValue)", terminator: " ")
            }
        }
    }
    
    
    //MARK: Other Methods of Game
    mutating func newGame(){
        self.deck = Card.newDeck(aceValue: 11)
        self.player = Player(score: 0, cards: [], playerName: "")
        self.hitPlayer = false
    }
    
    
    mutating func stopHits(){
        self.hitPlayer = false
        computerVsPlayer()
    }
    
    mutating func hitMe() -> Card?{
        self.deck = self.deck.shuffled()
        return deck.popLast()
    }
    
    mutating func gameStatus(_ newCard: Card) -> Bool{
        self.player.addCard(newCard)
        var playerScore: Int = 0
        for card in self.player.getCards(){
            playerScore += card.value
        }
        self.player.setScore(playerScore)
        
        printScore()
        print("score: \(self.player.getScore()).")
        
        if self.player.getScore() == 21 {
            print("BLACK JACK!!! You win!!!")
            return false
        } else if self.player.getScore() > 21{
            print("BUST. You lose.")
            return false
        }
        return true
    }

    
    //MARK: Accessors of Game
    func getDeck() -> [Card]{
        return self.deck
    }
    
    func getPlayer() -> Player{
        return self.player
    }
    
    func getHitPlayer() -> Bool{
        return hitPlayer
    }
    
    
    //MARK: Mutators of Game
    mutating func setDeck(_ newDeck: [Card]){
        self.deck = newDeck
    }
    
    mutating func setPlayer(_ newPlayer: Player){
        self.player = newPlayer
    }
    
    mutating func setHitPlayer(_ newHit: Bool){
        self.hitPlayer = newHit
    }
}

