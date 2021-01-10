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
    private(set) var deck: [Card]
    private(set) var field: [Card]
    private(set) var tomb: [Card] // matched (dead) cards
    
    func dealCards(more: Int) {
        
    }
    
    mutating func deckShuffle() {
        for _ in deck.indices {
            let c1 = deck.count.arc4random
            let c2 = deck.count.arc4random
            
            let tmp = deck[c1]
            deck[c1] = deck[c2]
            deck[c2] = tmp
        }
    }
    
    func deckShow() {
        for card in deck {
            print(card)
        }
    }
    
    init() {
        deck = []
        field = []
        tomb = []
        for shape in Card.Feature.all {
            for color in Card.Feature.all {
                for number in Card.Feature.all {
                    for shading in Card.Feature.all {
                        deck.append(Card(shape: shape, color: color, number: number, shading: shading))
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
