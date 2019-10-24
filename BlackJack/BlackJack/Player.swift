//
//  Player.swift
//  BlackJack
//
//  Created by Cameron Rivera on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct Player{
    //MARK: Properties of Player
    private var score: Int
    private var cards: [Card]
    private var playerName: String
    
    //MARK: Initializer of Player
    init(score: Int, cards: [Card], playerName: String){
        self.score = score
        self.cards = cards
        self.playerName = playerName
    }
    
    //MARK: Accessors of Player
    func getScore() -> Int{
        return self.score
    }
    
    func getCards() -> [Card]{
        return self.cards
    }
    
    func getPlayerName() -> String{
        return self.playerName
    }
    
    //MARK: Mutators of Player
    mutating func setScore(_ newScore: Int){
        self.score = newScore
    }
    
    mutating func setCards(_ newCards: [Card]){
        self.cards = newCards
    }
    
    mutating func addCard(_ newCard: Card){
        self.cards.append(newCard)
    }
    
    mutating func setPlayerName(_ newPlayer: String){
        self.playerName = newPlayer
    }
    
}
