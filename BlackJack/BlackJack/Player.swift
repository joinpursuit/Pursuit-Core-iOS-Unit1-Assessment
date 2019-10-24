//
//  Player.swift
//  BlackJack
//
//  Created by Oscar Victoria Gonzalez  on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
//
//Create a new Swift file called Player, create a struct of the same name.
//Add the following properties score of type Int, cards array of type [Card] and playerName of type String.

struct Player {
    var score: Int
    var cards = [Card]()
    var playerName: String
}


