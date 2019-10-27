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

//mainGameLoopYes:
//    repeat {
//        if userResponse == "yes" {
//            print("Do you want hit or pass? (hit, pass)")
//            userResponse = readLine()?.lowercased() ?? ""
//            innerGameLoopYes:
//            if userResponse == "hit" {
//                game.hitMe()
//                game.gameStatus() // if contunue prints "Do you want to hit or pass? (hit, pass)"
//                userResponse = readLine()?.lowercased() ?? ""
//                continue mainGameLoopYes
//            } else if userResponse == "pass" {
//                game.computerVsPlayer() //Game result and question: "Do you want to paly again? (yes/no)")
//                gameContinues = false
//            } else {
//                print("Do you want to play? (yes, no)")
//                userResponse = readLine()?.lowercased() ?? ""
//                if userResponse == "yes" {
//                    continue mainGameLoopYes
//                } else if userResponse == "no" {
//                    break mainGameLoopYes
//                } else {
//                    print("Entry error. You may start game from the begining.")
//                    print("Do you want to play again? (yes, no)")
//                    break mainGameLoopYes
//                }
//            }
//        } else if userResponse == "no" {
//            print("Bye!")
//            gameContinues = false
//        } else {
//            print("Confusing answer. Do you want to play? (yes, no)")
//            userResponse = readLine()?.lowercased() ?? ""
//        }
//        //game.computerVsPlayer() //Game result and question: "Do you want to paly again? (yes/no)")
//} while gameContinues


 print("Do you want hit or pass? (hit, pass)")
// here I should write main logic of the game
mainGameLoop:
    repeat {
        if userResponse == "hit" {
            game.hitMe()
            game.gameStatus() // if contunue prints "Do you want to hit or pass? (hit, pass)"
            userResponse = readLine()?.lowercased() ?? ""
        } else if userResponse == "pass" {
            game.computerVsPlayer() //Game result and question: "Do you want to paly again? (yes/no)")
            gameContinues = false
        } else if userResponse == "no" {
            print("Bye!")
            break mainGameLoop
        } else {
            print("Entry error. If you want to play again enter \"hit\" or \"pass\". Otherwise enter \"no\".")
            userResponse = readLine()?.lowercased() ?? ""
            if userResponse == "hit" {
                continue mainGameLoop
            } else if userResponse == "pass" {
                continue //mainGameLoop
            } else if userResponse == "no" {
                print("Bye!")
                break mainGameLoop
            } else {
                print("Entry error. You may start game from the begining.")
                break mainGameLoop
            }
        }
        //game.computerVsPlayer() //Game result and question: "Do you want to paly again? (yes/no)")
} while gameContinues

//userResponse = readLine()?.lowercased() ?? ""

//userResponse = readLine()?.lowercased() ?? ""
//if userResponse == "yes" {
//    game.newGame()
//} else if userResponse == "no" {
//    print("Bye!")
//} else {
//    print("Not valid answer. Try again.")
//}

