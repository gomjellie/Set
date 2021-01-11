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
        // Do any additional setup after loading the view.
        
        hideButtons()
        game.deckShuffle()
        game.deckShow()
        game.dealCards(more: 12)
        updateViewFromModel()
    }
    
    private func hideButtons() {
        for button in buttons {
            button.layer.borderWidth = 3.0
            button.layer.borderColor = UIColor.systemPurple.cgColor
            button.layer.cornerRadius = 8.0
            button.isHidden = true
        }
    }
    
    private let shapes = ["▲", "●", "■"]
    private let colors = [#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)]
    private let numbers = [1, 2, 3]
    private let shadings = [1 , 0.35, 2]
    
    private func updateViewFromModel() {
        for index in game.fields.indices {
            let field = game.fields[index]
            let button = buttons[index]
            let shape = shapes[field.shape.index]
            let color = colors[field.color.index]
//            let number = numbers[field.number.index]
            let shading = shadings[field.shading.index]
            let attributes: [NSAttributedString.Key: Any] = [
                .strokeWidth: shading == 2 ? 6 : -1,
                .foregroundColor: color.withAlphaComponent(CGFloat(shading)),
            ]
            let title: NSAttributedString = NSAttributedString(string: shape, attributes: attributes)
            
            button.setAttributedTitle(title, for: UIControl.State.normal)
            button.setTitleColor(color, for: UIControl.State.normal)
            button.isHidden = false
        }
    }

    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func onClickDealCard(_ sender: UIButton) {
        game.dealCards(more: 3)
    }
    
    
}

