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
    var player = Player(score: 0, cards: [])
    var hitPLayer = true
    var playerDealtcards = Array<Any>()
//    var hasMoreCards:Bool {
//        return true
//    }
    
    var randomComputerScore: Int {
       return .random(in: 15...21)
    }

    func newGame(){
       deck = Card.newDeck(aceValue: 11)
       hitPLayer = true
       player.score = 0
       player.cards.removeAll()
    }
    
    func moreHits() -> Bool{
       print(userPrompt)
       let hitOrPass = readLine()?.lowercased() ?? "pass"
       if hitOrPass == "hit"{
        return true
       }else{
        return false
        }
    }
        
    func hitme(){
        var shufdeck = deck.shuffled()
        player.score += (shufdeck.last?.value ?? 0)
        playerDealtcards.append(shufdeck.last ?? 0)
        player.cards.append(shufdeck.last ?? <#Card#>)
        shufdeck.removeLast()
        print("\(playerDealtcards)    \(player.score)")
        
    }

    func computerVsPlayer(){
        if  (player.score) > (randomComputerScore){
        print("You won your score is \(player.score) and my score was \(randomComputerScore)")
        } else if (player.score) < (randomComputerScore) {
         print("You lost you score was \(player.score) and my score was \(randomComputerScore)")
        } else if (player.score) == (randomComputerScore) {
         print("Wow we both had \(player.score), its a tie")
         //draws a random number for the computer and determines the winner of the game.
        }
    }

    
    func gameStatus(){
        switch player.score{
        case 21:
            print("BlackJack. You win!! with a score of \(player.score)")
            print(blackJack)
            return
        case 22..<100:
            print("Bust !!! Whew, you almost had it your score of \(player.score) is too high")
            print(bust)
        default:
            print("Continue Playing?")
            
}

}
}



