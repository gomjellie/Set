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
        
        for button in buttons {
            button.layer.borderWidth = 3.0
            button.layer.borderColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            button.layer.cornerRadius = 8.0
            button.isHidden = true
        }
        dealButton.layer.borderWidth = 3.0
        dealButton.layer.cornerRadius = 8.0
        
        game.deckShuffle()
        game.dealCards(more: 12)
        updateViewFromModel()
    }
    
    private func hideButtons() {
        for button in buttons {
            button.isHidden = true
        }
    }
    
    private let shapes = ["▲", "●", "■"]
    private let colors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)]
    private let numbers = [1, 2, 3]
    private let shadings = [1 , 0.25, 2]
    
    private func updateViewFromModel() {
        hideButtons()
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
            button.layer.borderColor = field.isSelected ? #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        }
        
        if game.decks.count == 0 {
            dealButton.isEnabled = false
            dealButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }
    
    @IBAction func onCardClick(_ sender: UIButton) {
        if let index = buttons.firstIndex(of: sender) {
            let card = game.fields[index]
            if !card.isSelected {
                game.select(card: card)
            } else {
                game.unSelect(card: card)
            }
            
            sender.layer.borderColor = card.isSelected ? #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            
            updateViewFromModel()
        }
    }
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var dealButton: UIButton!
    
    @IBAction func onClickDealCard(_ sender: UIButton) {
        game.dealCards(more: 3)
        updateViewFromModel()
    }
    
    
}

