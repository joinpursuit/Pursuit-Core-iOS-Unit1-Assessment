//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

let game = Game()
var gameOver = false
var multiGameOver = false
var hitLoop = false
var player1Loop = false
var player2Loop = false
var multiPlayerHitLoop = false
var player1PassCheck = false
var player2PassCheck = false

var player = Game.player1.player1Name

print("Welcome to Black Jack!")
print()
//game.setPlayer1Name()
game.howManyPlayers()

// MARK: Single Player Loop
if Game.multiplayer == false {
    print("\n\n\n\n\n")
    repeat {
        game.newGame()
        game.hitMe()
        
        repeat {
            game.player1HitOrPass()
            let userInput = readLine()?.lowercased() ?? "pass"
            print()
            if userInput == "hit" {
                game.hitMe()
                gameOver = true
                hitLoop = true
                if game.player1Score >= 21 {
                    break
                }
                print()
            }
            if userInput == "pass" {
                game.computerVsPlayer()
                gameOver = false
                hitLoop = false
            }
        } while hitLoop
        print("Would you like to play again?")
        let contPrompt = readLine()?.lowercased()
        if contPrompt == "no" {
            gameOver = false
        } else if contPrompt == "yes" {
            // game.newGame()
            gameOver = true
        } else {
            print("Invalid choice, better next time...")
            gameOver = false
        }
    } while gameOver
}

// MARK: Multiplayer loop
if Game.multiplayer == true {
    print("\n\n\n\n\n")
    multiGameOver = true
    game.hitMePlayer1()
    game.hitMePlayer2()
    repeat {
        

        
        repeat {
            repeat {
                
                print("\n\n\(game.player1currentCards)\n")
                print("\(game.player1Name) Score: \(game.player1Score)")
                print("\(game.player2Name) Score: \(game.player2Score)\n")
                game.player1HitOrPass()
                let player1Input = readLine()?.lowercased() ?? "pass"
                switch player1Input {
                case "hit":
                    game.hitMePlayer1()
                    multiPlayerHitLoop = true
                case "pass":
                    player1Loop = false
                default:
                    print("Please enter a valid option")
                    player1Loop = true
                }
                if game.player1Score > 21 {
                    break
                }
            } while player1Loop
            
            print("There are \(game.shuffledDeck.count) cards left in the deck")
            repeat {
                
                print("\n\n\(game.player2currentCards)\n")
                print("\(game.player1Name) Score: \(game.player1Score)")
                print("\(game.player2Name) Score: \(game.player2Score)\n")
                game.player2HitOrPass()
                
                let player2Input = readLine()?.lowercased() ?? "pass"
                switch player2Input {
                case "hit":
                    game.hitMePlayer2()
                case "pass":
                    player2Loop = false
                default:
                    print("Please enter a valid option")
                    player2Loop = true
                }
                if game.player2Score > 21 {
                    break
                }
            } while player2Loop
            
            print("There are \(game.shuffledDeck.count) cards left in the deck")
            if game.player1Score > 21 || game.player2Score > 21 {
                game.player1VSplayer2()
                break
            }
        } while multiPlayerHitLoop
        
    } while multiGameOver
    
} // Multiplayer true loop
