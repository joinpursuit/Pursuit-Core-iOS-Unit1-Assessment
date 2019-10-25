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

print(gameIntro)
repeat {
    print(gamePrompt)
    var userChoice = readLine()?.lowercased() ?? ""
    game.hitMe(userChoice: userChoice)
    
//    repeat{
////        print(gamePrompt)
////        userChoice = readLine()?.lowercased() ?? ""
////        game.hitMe(userChoice: userChoice)
////
//        print("Thanks for playing!")
//    } while true
} while true
