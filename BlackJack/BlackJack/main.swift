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
var multiplayerContPrompt = false
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
        

        
        outerLoop: repeat {
            repeat {
                if Game.player1.score > 21 {
                      break
                }
                print("\n\n\(game.player1Name)s' cards: (\(game.player1currentCards))\n")
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
                    player1PassCheck = true
                default:
                    print("Please enter a valid option")
                    player1Loop = true
                }

            } while player1Loop
            print()
            print("There are \(game.shuffledDeck.count) cards left in the deck \n")
            if Game.player1.score > 21 {
                 player2Loop = false
            }
            
            if game.player1Score > 21 || game.player2Score > 21 {
                game.player1VSplayer2()
                multiPlayerHitLoop = false
                multiGameOver = false
                 break outerLoop
            }
            repeat {
                
                print("\n\n\(game.player2Name)s' cards: (\(game.player2currentCards))\n")
                print("\(game.player1Name) Score: \(game.player1Score)")
                print("\(game.player2Name) Score: \(game.player2Score)\n")
                game.player2HitOrPass()
                
                let player2Input = readLine()?.lowercased() ?? "pass"
                switch player2Input {
                case "hit":
                    game.hitMePlayer2()
                case "pass":
                    player2Loop = false
                    player2PassCheck = true
                default:
                    print("Please enter a valid option")
                    player2Loop = true
                }
                if game.player2Score > 21 {
                    
                }
            } while player2Loop
            print()
            print("There are \(game.shuffledDeck.count) cards left in the deck\n")
            if player1PassCheck && player2PassCheck == true {
                game.player1VSplayer2()
                multiPlayerHitLoop = false
                multiGameOver = false
                player1PassCheck = false
                player2PassCheck = false
            }
            if game.player1Score > 21 || game.player2Score > 21 {
                game.player1VSplayer2()
                multiPlayerHitLoop = false
                multiGameOver = false
            }
        } while multiPlayerHitLoop
        
        repeat {
        print("Would you like to play again? (yes, no)")
        let userInput = readLine()?.lowercased() ?? "no"
        switch userInput {
        case "yes":
            multiGameOver = true
            game.newGame()
        case "no":
            print("Goodbye!")
            multiGameOver = false
        default:
            print("Please select a valid option")
            multiplayerContPrompt = true
            }
        } while multiplayerContPrompt
        } while multiGameOver
    }

