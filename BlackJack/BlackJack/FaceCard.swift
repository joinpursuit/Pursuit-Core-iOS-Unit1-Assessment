//
//  FaceCard.swift
//  BlackJack
//
//  Created by Joshua Wynter on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

enum FaceCard: String {
    case jack = "🎃"
    case queen = "👸🏾"
    case king = "🤴🏾"
}


extension FaceCard {
    static let allCases: [FaceCard] = [.jack, .queen, .king]
}
