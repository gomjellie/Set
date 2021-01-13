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
    
    mutating func onMatch() {
        for select in selects {
            tombs.append(select)
            fields.removeAll(where: { $0 == select })
        }
        
        selects.removeAll()
    }
    
    mutating func select(card: Card) {
        if selects.count >= 3 {
            return
        }
        selects.append(card)
        card.isSelected = true
        
        var conditionCount = 0
        
        if selects.count != 3 {
            return
        }
        
        var matchCounter: [String: [Int: Int]] = [
            "shape": [0: 0, 1: 0, 2: 0],
            "number": [0: 0, 1: 0, 2: 0],
            "shading": [0: 0, 1: 0, 2: 0],
            "color": [0: 0, 1: 0, 2: 0],
        ]
        
        
        for select in selects {
            matchCounter["shape"]?[select.shape.index]! += 1
            matchCounter["number"]?[select.number.index]! += 1
            matchCounter["shading"]?[select.shading.index]! += 1
            matchCounter["color"]?[select.color.index]! += 1
        }
        
        for match in matchCounter {
            let condition = match.value.filter({ (key: Int, value: Int) -> Bool in
                // 하나의 Feature를 2개가 공유하면 안됨
                return value == 2
            })
            
            if condition.count == 0 {
                print(match.key, "condition ++")
                conditionCount += 1
            }
        }
        
//        if conditionCount == 4 {
//            print("Match!")
            onMatch()
//        }
    }
    
    mutating func unSelect(card: Card) {
        card.isSelected = false
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
