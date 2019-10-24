//
//  Suit.swift
//  BlackJack
//
//  Created by Joshua Wynter on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

enum Suit: String {
    case diamond = "♦️"
    case heart = "♥️"
    case spade = "♠️"
    case club = "♣️"
}
extension Suit {
    static let allCases: [Suit] = [.diamond, .heart, .spade, .club]
}
