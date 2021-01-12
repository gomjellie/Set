//
//  ViewController.swift
//  Set
//
//  Created by Jacky on 2020/08/16.
//  Copyright © 2020 Jacky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var game = SetGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideButtons()
        game.deckShuffle()
        game.dealCards(more: 12)
        updateViewFromModel()
    }
    
    private func hideButtons() {
        for button in buttons {
            button.layer.borderWidth = 3.0
            button.layer.borderColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            button.layer.cornerRadius = 8.0
            button.isHidden = true
        }
    }
    
    private let shapes = ["▲", "●", "■"]
    private let colors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)]
    private let numbers = [1, 2, 3]
    private let shadings = [1 , 0.25, 2]
    
    private func updateViewFromModel() {
        for index in game.fields.indices {
            let field = game.fields[index]
            let button = buttons[index]
            let shape = shapes[field.shape.index]
            let color = colors[field.color.index]
            let number = numbers[field.number.index]
            let shading = shadings[field.shading.index]
            
            let cardTitle = String(repeating: shape, count: number)
            
            let attributes: [NSAttributedString.Key: Any] = [
                .strokeWidth: shading == 2 ? 6 : -1,
                .foregroundColor: color.withAlphaComponent(CGFloat(shading)),
            ]
            let attributedTitle: NSAttributedString = NSAttributedString(string: cardTitle, attributes: attributes)
            
            button.setAttributedTitle(attributedTitle, for: UIControl.State.normal)
            button.setTitleColor(color, for: UIControl.State.normal)
            button.isHidden = false
        }
    }
    
    func onSelect() {
        var conditionCount = 0
        
        if game.selects.count != 3 {
            return
        }
        
        var matchCounter: [String: [Int: Int]] = [
            "shape": [0: 0, 1: 0, 2: 0],
            "number": [0: 0, 1: 0, 2: 0],
            "shading": [0: 0, 1: 0, 2: 0],
            "color": [0: 0, 1: 0, 2: 0],
        ]
        
        
        for select in game.selects {
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
        
        if conditionCount == 4 {
            print("Match!")
        }
    }

    @IBAction func onCardClick(_ sender: UIButton) {
        if let index = buttons.firstIndex(of: sender) {
            let card = game.fields[index]
            let isSelected = sender.layer.borderColor == #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            sender.layer.borderColor = isSelected ? #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            
            if isSelected {
                game.select(card: card)
                onSelect()
            } else {
                game.unSelect(card: card)
            }
        }
    }
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func onClickDealCard(_ sender: UIButton) {
        game.dealCards(more: 3)
    }
    
    
}

