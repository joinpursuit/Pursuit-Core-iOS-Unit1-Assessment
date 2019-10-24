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
//print("There are \(Card.newDeck(aceValue: 1).count) in a deck of cards")
// TODO: remove these lines after you have added the Suit and FaceCard enums as per the assessment REA
// There are 52 in a deck of cards
// new
//Create an instance of the Game()
//Call newGame on the newly created instance above.
//Create a gameOver instance and set it to false. This will be used in your repeat-while to determine if game play should stop.
//Use a repeat-while to allow the user options between getting new cards by calling the hitMe() method or passing by calling the stopHits() method.
//When the player has won or lost ask them if they would wish to continue playing another round.
let game = Game()


var playAgain = false
let userPrompt = """
Do you want to hit or pass
"""


//repeat{ // checks if user wants to continue
//    
//    
//    print(userPrompt)
//    let userResponse = readLine() ?? ""
//    
////    game.selectTrivia(userResponse)
//    repeat{ // goes through the question array
//        guard let question = game.getQuestion() else {
//            break
//        }
//        print(question.questionPrompt)
//        print(question.choices)
//        let userAnswer = readLine() ?? ""
//        game.checkAnswer(userAnswer: userAnswer, question: question)
//
//    } while game.hasMoreQuestions
//
//    game.finalScore()
//
//    //prompt user wether or not they want to keep playing
//
//    print("Would you like to play again (yes, no)")
//    let keepPlaying = readLine() ?? ""
//    if keepPlaying == "yes"{
//        game.reset()
//        playAgain = true
//    } else {
//        playAgain = false
//    }
//} while playAgain
//
