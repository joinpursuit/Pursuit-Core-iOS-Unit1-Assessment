//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

var game = Game()
var gameContinue: Bool = false

repeat {
    print("""
Welcome to Black Jack
Please enter your name
""")
    let name = readLine()!
    game.player.playerName = name
    game.deck = Card.newDeck(aceValue: 1)
    game.hitMe()
    game.hitMe()
    repeat {
        game.hitChoice()
    } while game.hitPlayer
    game.hitPlayer = true
} while gameContinue


