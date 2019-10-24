//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

var onePlayerGame = Game(deck: [], player: Player(score: 0, cards: [], playerName: ""), hitPlayer: false)
var twoPlayerGame = TwoPlayerGame(deck: [], player1: Player(score: 0, cards: [], playerName: ""), player2: Player(score: 0, cards: [], playerName: ""), hitPlayer: false)
var gameOver = false
var userResponse: String = ""
var keepPlaying = true
var oneOrTwo = "3"
var whosTurn: Int = 1
var playerOnePass = false
var playerTwoPass = false

outerLoop: repeat{
    
    print("Would you like to play a one player, or two player game?\n1. One Player, against the computer\n2. Two Players, against another player")
    userResponse = readLine() ?? ""
    
    while userResponse != "1" && userResponse != "2"{
        print("Would you like to play a one player, or two player game?\n1. One Player\n2. Two Players")
        userResponse = readLine() ?? ""
    }
    
    if userResponse == "1"{
        onePlayerGame.newGame()
        
        repeat{
            print("Type \"hit\" to draw a card, and \"pass\" to pass: ", terminator: "")
            userResponse = readLine() ?? ""
            userResponse = userResponse.lowercased()
            
            while userResponse != "hit" && userResponse != "pass"{
                print("Type \"hit\" to draw a card, and \"pass\" to pass: ", terminator: "")
                userResponse = readLine() ?? ""
                userResponse = userResponse.lowercased()
            }
            
            if userResponse == "hit"{
                if let unwrappedCard = onePlayerGame.hitMe(){
                    keepPlaying = onePlayerGame.gameStatus(unwrappedCard)
                }
            } else if userResponse == "pass"{
                onePlayerGame.stopHits()
                keepPlaying = false
            }
        } while keepPlaying
    } else if userResponse == "2"{
        twoPlayerGame.newGame()
        
        repeat{
            twoPlayerGame.printScore(whosTurn)
            if whosTurn == 1{
                print("Player\(whosTurn)'s score: \(twoPlayerGame.getPlayer1().getScore())")
            } else{
                print("Player\(whosTurn)'s score: \(twoPlayerGame.getPlayer2().getScore())")
            }
            print("Type hit to draw a card, pass to pass, restart to restart from the main menu, and exit to quit the game: ", terminator: "")
            userResponse = readLine() ?? ""
            userResponse = userResponse.lowercased()
            
            while userResponse != "hit" && userResponse != "pass" && userResponse != "restart" && userResponse != "exit"{
                print("Type hit to draw a card, pass to pass, restart to restart from the main menu, and exit to quit the game: ", terminator: "")
                userResponse = readLine() ?? ""
                userResponse = userResponse.lowercased()
            }
            
            if userResponse == "hit"{
                if let unwrappedCard = twoPlayerGame.hitMe(){
                    keepPlaying = twoPlayerGame.gameStatus(unwrappedCard,whosTurn)
                }
            } else if userResponse == "pass"{
                if whosTurn == 1{
                    playerOnePass = twoPlayerGame.stopHits(whosTurn)
                } else if whosTurn == 2{
                    playerTwoPass = twoPlayerGame.stopHits(whosTurn)
                }
            } else if userResponse == "restart"{
                userResponse = "1"
                break
            } else if userResponse == "exit"{
                break outerLoop
            }
            if !playerOnePass && !playerTwoPass{
                if whosTurn == 1{
                    whosTurn = 2
                } else {
                    whosTurn = 1
                }
            } else if playerOnePass && playerTwoPass {
                twoPlayerGame.PlayerVsPlayer(whosTurn)
                keepPlaying = false
            } else if playerOnePass{
                whosTurn = 2
            } else if playerTwoPass {
                whosTurn = 1
            }
            print()
        } while keepPlaying
        
    }
    
    if userResponse != "1"{
        print("Would you like to play again?\n1. Yes\n2. No")
        userResponse = readLine() ?? ""
        
        while userResponse != "1" && userResponse != "2"{
            print("Would you like to play again?\n1. Yes\n2. No")
            userResponse = readLine() ?? ""
        }
    }
    if userResponse == "1" {
        gameOver = true
        userResponse = ""
        whosTurn = 1
        playerOnePass = false
        playerTwoPass = false
    } else {
        gameOver = false
    }
}while gameOver
