//
//  ViewController.swift
//  Concetration
//
//  Created by Sai-Mork on 7/3/19.
//  Copyright © 2019 Kasidid Wachirachai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount: Int = 0 { didSet { flipCountLabel.text = "Flips : \(flipCount)" } }
    
    var emojiChoices = ["🎃","👻","🔥","🥶","😓","🤬"]
    
    var emoji = [Int:String]()
    

    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of:sender){
            game.chooseCard(at: cardNumber)
            UpdateViewFromModel()
        } else {
            print("This button's not assigned")
        }
    }
    
    @IBAction func restartButton(_ sender: UIButton) {
        emojiChoices = ["🎃","👻","🔥","🥶","😓","🤬"]
        emoji.removeAll()
        game.resetGame()
        for button in cardButtons {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        }
    }
    
    func UpdateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }

}

