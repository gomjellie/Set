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
//        game.deckShuffle()
        game.deckShow()
    }
    
    private func hideButtons() {
        for button in buttons {
            button.isHidden = true
        }
    }

    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func onClickDealCard(_ sender: UIButton) {
    }
    
    
}

