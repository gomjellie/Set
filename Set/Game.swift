//
//  Game.swift
//  Set
//
//  Created by Jacky on 2021/01/11.
//  Copyright © 2021 Jacky. All rights reserved.
//

import Foundation

struct SetGame
{
    private(set) var decks: [Card]
    private(set) var fields: [Card]
    private(set) var tombs: [Card] // matched (dead) cards
    private(set) var selects: [Card]
    
    mutating func dealCards(more: Int) {
        for _ in 1...more {
            assert(decks.count != 0)
            let newCard = decks.remove(at: 0)
            fields.append(newCard)
        }
    }
    
    mutating func deckShuffle() {
        for _ in decks.indices {
            let c1 = decks.count.arc4random
            let c2 = decks.count.arc4random
            
            let tmp = decks[c1]
            decks[c1] = decks[c2]
            decks[c2] = tmp
        }
    }
    
    mutating func select(card: Card) {
        if selects.count >= 3 {
            return
        }
        selects.append(card)
    }
    
    mutating func unSelect(card: Card) {
        selects.removeAll { (c: Card) -> Bool in
            return c == card
        }
    }
    
    init() {
        decks = []
        fields = []
        tombs = []
        selects = []
        for shape in Card.Feature.all {
            for color in Card.Feature.all {
                for number in Card.Feature.all {
                    for shading in Card.Feature.all {
                        decks.append(Card(shape: shape, color: color, number: number, shading: shading))
                    }
                }
            }
        }
    }
    
}

extension Int {
    var arc4random: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}
