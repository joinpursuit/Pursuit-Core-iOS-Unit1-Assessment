//
//  Game.swift
//  BlackJack
//
//  Created by Edward O'Neill on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {
    var deck: [Card]
    var player: Player
    var hitPlayer: Bool
    var computerScore = 0
    var hasMoreCards: Bool {
        return true
    }
    var randomComputerScore: Int {
        let scoreList = [18, 19, 20, 21]
        return scoreList.randomElement() ?? 18
    }
    static var contitueInputType: Set<String> = ["quit", "leave", "no", "n"]
    
    init(deck: [Card], player: Player, hitPlayer: Bool) {
        self.deck = deck
        self.player = player
        self.hitPlayer = hitPlayer
    }
    
    func newGame() {
        deck.removeAll()
        deck = Card.newDeck(aceValue: 1)
        player.score = 0
        player.cards.removeAll()
        computerScore = 0
    }
    
    func stopHits() -> Int {
        return self.randomComputerScore
    }
    
    func hitMe() -> Card {
        self.deck = self.deck.shuffled()
        return self.deck.removeLast()
    }

    // I know that you're going to hate the way I did for the face card but please forgive me...r
    func playerScore() {
        for card in self.player.cards {
            switch card.suit {
            case .club:
                    switch card.face {
                    case .jack:
                        print("\(Suit.club.rawValue)🎃", terminator: " ")
                    case .queen:
                        print("\(Suit.club.rawValue)👸", terminator: " ")
                    case .king:
                        print("\(Suit.club.rawValue)🤴", terminator: " ")
                    default:
                        print("\(Suit.club.rawValue)\(card.value)", terminator: " ")
                    }
            case .spade:
                switch card.face {
                case .jack:
                    print("\(Suit.spade.rawValue)🎃", terminator: " ")
                case .queen:
                    print("\(Suit.spade.rawValue)👸", terminator: " ")
                case .king:
                    print("\(Suit.spade.rawValue)🤴", terminator: " ")
                default:
                    print("\(Suit.spade.rawValue)\(card.value)", terminator: " ")
                }
            case .dimond:
                switch card.face {
                case .jack:
                    print("\(Suit.dimond.rawValue)🎃", terminator: " ")
                case .queen:
                    print("\(Suit.dimond.rawValue)👸", terminator: " ")
                case .king:
                    print("\(Suit.dimond.rawValue)🤴", terminator: " ")
                default:
                    print("\(Suit.dimond.rawValue)\(card.value)", terminator: " ")
                }
            case .heart:
                switch card.face {
                case .jack:
                    print("\(Suit.heart.rawValue)🎃", terminator: " ")
                case .queen:
                    print("\(Suit.heart.rawValue)👸", terminator: " ")
                case .king:
                    print("\(Suit.heart.rawValue)🤴", terminator: " ")
                default:
                    print("\(Suit.heart.rawValue)\(card.value)", terminator: " ")
                }
            }
        }
        
        print("score: \(player.score)")
    }
    
    func gameStatus() {
        if self.player.score > 21 {
            print("Bust...")
            print("Would you like to play again?\n(Yes / No)")
        } else if self.player.score == 21 {
            print("BlackJack!!!!!")
            print("Would you like to play again?\n(Yes / No)")
        } else {
            print("Would you like to hit again?\n(hit / pass)")
        }
    }
    
    func continueGame(userInput: String) -> Bool {
        if Game.contitueInputType.contains(userInput) {
            return false
        } else {
            return true
        }
    }
}
