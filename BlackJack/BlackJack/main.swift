//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

//print("""
//db   d8b   db d88888b db       .o88b.  .d88b.  .88b  d88. d88888b d888888b  .d88b.  d8888b. db       .d8b.   .o88b. db   dD    d88b  .d8b.   .o88b. db   dD
//88   I8I   88 88'     88      d8P  Y8 .8P  Y8. 88'YbdP`88 88'     `~~88~~' .8P  Y8. 88  `8D 88      d8' `8b d8P  Y8 88 ,8P'    `8P' d8' `8b d8P  Y8 88 ,8P'
//88   I8I   88 88ooooo 88      8P      88    88 88  88  88 88ooooo    88    88    88 88oooY' 88      88ooo88 8P      88,8P       88  88ooo88 8P      88,8P
//Y8   I8I   88 88~~~~~ 88      8b      88    88 88  88  88 88~~~~~    88    88    88 88~~~b. 88      88~~~88 8b      88`8b       88  88~~~88 8b      88`8b
//`8b d8'8b d8' 88.     88booo. Y8b  d8 `8b  d8' 88  88  88 88.        88    `8b  d8' 88   8D 88booo. 88   88 Y8b  d8 88 `88. db. 88  88   88 Y8b  d8 88 `88.
// `8b8' `8d8'  Y88888P Y88888P  `Y88P'  `Y88P'  YP  YP  YP Y88888P    YP     `Y88P'  Y8888P' Y88888P YP   YP  `Y88P' YP   YD Y8888P  YP   YP  `Y88P' YP   YD
//""")

var game = Game()
game.newGame() // prints Do you want to hit or pass? (hit, pass)

var gameContinues = true
var userResponse = readLine()?.lowercased() ?? ""

// here I should write main logic of the game
repeat {
if userResponse == "hit" {
    game.hitMe()
    game.gameStatus() // if contunue prints "Do you want to hit or pass? (hit, pass)"
    userResponse = readLine()?.lowercased() ?? ""
} else if userResponse == "pass" {
    game.gameStatus()
    gameContinues = false
} else {
    print("Not valid answer. Try again.")
}
    //game.computerVsPlayer() //Game result and question: "Do you want to paly again? (yes/no)")
} while gameContinues

