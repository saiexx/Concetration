//
//  Card.swift
//  Concetration
//
//  Created by Sai-Mork on 7/3/19.
//  Copyright © 2019 Kasidid Wachirachai. All rights reserved.
//

import Foundation
struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniquieIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniquieIdentifier()
    }
}
