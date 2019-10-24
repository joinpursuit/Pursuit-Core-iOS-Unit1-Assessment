//
//  Game.swift
//  BlackJack
//
//  Created by Tanya Burke on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {

    var deck = [Card]()
    var player = Player(score: 0, cards: [], playerName: "tanya")
    var hitPLayer = true
    
    var hasMoreCards:Bool {
        return true
    }
    
    var randomComputerScore: Int {
       return .random(in: 10...21)
    }

//    init(player: String,
//        hitplayer: Bool) {
//        self.player = player
//        self.hitPLayer =  hitPLayer
    
    
    func newGame(){
        player.cards = Card.newDeck(aceValue: 11)
        
       
        }

    func stopHits(){
        //called if the user wishes to pass their turn. In that case the computer draws a random number and a winner is chosen between the computer's score and the player's score.
    }

    func hitme(){

    }

    func computerVsPlayer(){
        //draws a random number for the computer and determines the winner of the game.
    }

    func gameStatus(_ score:Int) -> Bool{
        //takes in the player's card and determines the current score. Here the player score options can be, BlackJack, Bust or Continue playing as their status is still valid for game play.
        switch score{
        case 21:
           print("BlackJack\n You win!!")
           print(blackJack)
        case 22..<100:
            print("Bust")
            print(bust)
        default:
            print("Continue Playing?")

    }
}



}






