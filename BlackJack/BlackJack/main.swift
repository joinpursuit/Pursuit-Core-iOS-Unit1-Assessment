//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

print(welcome)

sleep(3)


//Call newGame on the newly created instance above.
//Create a gameOver instance and set it to false. This will be used in your repeat-while to determine if game play should stop.
//Use a repeat-while to allow the user options between getting new cards by calling the hitMe() method or passing by calling the stopHits() method.
//When the player has won or lost ask them if they would wish to continue playing another round.
let game = Game()
game.newGame()


var playAgain = false
let userPrompt = """
Do you want to hit or pass
"""


repeat{
    
    print(userPrompt)
    let userResponse = readLine() ?? "pass"
    if userResponse == "hit"{
        repeat{
            game.hitme()
            
            game.gameStatus()
            game.hasMoreCards = game.moreHits()
            
        } while game.player.score <= 20 || playAgain == true
        
        game.gameStatus()
        print("Do you want to play again? yes or no ")
        let yesOrNo = readLine()?.lowercased() ?? "no"
        if yesOrNo == "yes"{
            game.newGame()
            playAgain = true
        } else {
            playAgain = false
        }
        
    }    else if userResponse == "pass"{
             playAgain = false
        game.computerVsPlayer()
        print("Do you want to play again? yes or no ")
        let yesOrNo = readLine()?.lowercased() ?? "no"
        if yesOrNo == "yes"{
            game.newGame()
            playAgain = true
        } else {
            playAgain = false
        }

    
}
}while playAgain == true




