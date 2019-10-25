//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

var playAgain = false
print("Welcome to BlackJack! Enter your name.")
let game = Game(player: Player(playerName: readLine() ?? "Melvin"))

repeat {
 
    game.deck = Card.newDeck(aceValue: 1).shuffled()
    print("Hit or stay?")
    repeat {
        let hitOrStay = readLine() ?? "hit"
        if hitOrStay == "hit" {
        guard let card = game.hitMe() else {
            break
        }
        game.player.cards.append(card)
            print(game.gameStatus(card, game.player.cards))
            if game.busted == true {
                print("You busted! House wins!")
                break
            }
            if game.player.score == 21 {
                print("Blackjack! You win!")
                break
            }
        } else if hitOrStay == "stay"{
            game.hitPlayer = false
            print(game.computerVsPlayer(game.player.score))
        } else {
            print("Please enter a valid command.")
            
        }
    } while game.hitPlayer == true

    print("Would you like to play another hand? (y/n)") //
    let anotherHand = readLine()?.lowercased() ?? "y"
    if anotherHand == "y" {
        playAgain = true
        game.newGame()
    } else {
        playAgain = false
    }
} while playAgain == true
