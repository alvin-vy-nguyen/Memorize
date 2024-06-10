//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Alvin Nguyen on 6/9/24.
//

import Foundation
// Does not do UI or use SwiftUI as it is the model
struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent //Is a don't care type. If used, you have to say what it is
        
    }
    
}
