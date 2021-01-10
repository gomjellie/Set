//
//  Card.swift
//  Set
//
//  Created by Jacky on 2021/01/11.
//  Copyright © 2021 Jacky. All rights reserved.
//

import Foundation

struct Card: CustomStringConvertible
{
    var description: String {
        let shapes = ["▲", "●", "■"]
        let colors = ["red", "green", "purple"]
        let numbers = [1, 2, 3]
        let shadings = ["solid", "striped", "open"]
        
        let shape = shapes[self.shape.val]
        let color = colors[self.color.val]
        let number = numbers[self.number.val]
        let shading = shadings[self.shading.val]
        
        return "\(shape) \(color) \(number) \(shading)"
    }
    
    var shape: Feature;
    var color: Feature;
    var number: Feature;
    var shading: Feature;
    
    enum Feature {
        case one
        case two
        case three
        
        var val: Int {
            switch self {
            case .one: return 0
            case .two: return 1
            case .three: return 2
            }
        }
        
        static var all: [Feature] {
            return [.one, .two, .three]
        }
    }
}
