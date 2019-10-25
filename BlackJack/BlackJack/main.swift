//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

// TODO: remove these lines after you have added the Suit and FaceCard enums as per the assessment README
print("There are \(Card.newDeck(aceValue: 1).count) in a deck of cards")
// There are 52 in a deck of cards

let gameIntro = """
.(
,@( .(%@#.     &
(@&@&*              ,
/&@(                      @
.#@&,                              .*
.@                                     @
%@.   @%                                /
.@#    @  *@                               @
*(   %(   .   #              /#                  (
%    @.   &   @@           .(#(&                &
@    &  (/  &@@@          (@%&*#              *
*&   /%  ,@   *          #/@((#*.#%%/           @
/%  @@@@ (.           ,(./@(  %*&&,&,        .*
(*  .#. .@          /(&,@(     .#(%@(@#%       @
#.      *,        /((#%% .#%@@@%#*###&/#@      (
&       @       ((@**#/@#&@%&.*.&%.#,&*.(%    @
.&      ,      ,%%&((*@ *(*@@(*(@&& ,/@.&%@    /
/%      &     @@%&*,#@&@&@@@&&/#&@,  (#/ &@   &
(*     (    ((#@ .@,**@%*#**%   #(**&%    ,
#.     @   &(%#@#   #&&./@,@#    #,/&.#.   @
&     /.  %(@@@*(    ,((##(.    .(..*#@@    .*
.@     @   @&@#/,(.    ,((**#*//&@/.@&@,     @
/%    *.  .@# @(,@#,,%&@#**&&.@%/@(@(       ./
/(    @    /&%@@*,&(&%&%#/%%&*//*.     ./&& &
#.   ,,     *#@@@@@%**&&&@&%,         %@@#  (
%    @              ,%&/@(@#@            / &
.@   .              ##&@@#**,       ,@ %  #
*&   @            .*.                  @/  %
/(  /.                                     *
#,  @                              .#@&(.
%  *.                     *%@@@#
.@  @             .%@%,  #@*
,& ,,    *&@(.     /@(
/( ,,         %@*
(*      (@/
/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  %  &&,      &@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*
....     ..        .....      . ..  ...  ..     ...   .....      . ..  ...  ..
,@@@@@@& @@@@      &@@@@@@  ,@@@@@@ /@@@.@@@&   *@@@. &@@@@@@   @@@@@@ ,@@@*@@@@
#@& .@@  @@        @@ @@*  %@% *@@  &@/ @@/     %@&   @@ @@,  (@# .@@  #@# @@*
@@@@@@. &@@@      &@@@@@@ .@@@     .@@@@&       @@@  @@@@@@@  @@@      @@@@@
#@& .@@  @@   @@  /@@ .@@  %@% *@@  %@( &@% @@, %@%  (@@ .@@  (@# .@@  #@% %@(
.@@@@@@@ @@@@@@@@,,@@@.@@@& *@@@@@% /@@@ @@@%&@@@@@, *@@@ @@@% .@@@@@@ .@@@,@@@@
/////.  /////*//  /// ///,   *//.  ./// ///, .//*    /// ///,   *//.   /// ///*
*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*


Hi! Welcome to BlackJack!

"""

var gamePrompt = """
Please type in 'hit' or 'pass'.
"""

let game = Game(deck: [Card](), player: Player(score: 0, cards: [Card](), playerName: ""), hitPlayer: true)
//probably needs to be fixed

let gameOver = false


print(gameIntro)
startloop: repeat {
    print(gamePrompt)
    let userChoice = readLine()?.lowercased() ?? ""
    // repeat{
    
    if userChoice == "hit" {
        let _ = game.hitMe(userChoice: userChoice)
    } else if userChoice == "pass" {
        game.stopHits(userChoice: userChoice)
    }
    
    
    if game.deck.isEmpty {
        print("Would you like to play again (yes, no)?")
        let userReplay = readLine()?.lowercased() ?? ""
        if userReplay == "yes"{
            game.newGame()
            continue startloop
        }else {
            print("Thank you for playing BlackJack!")
            break
        }
    }
    
    
    
} while game.hasMoreCards
