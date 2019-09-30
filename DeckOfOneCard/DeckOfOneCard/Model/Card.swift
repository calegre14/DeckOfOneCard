//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Christopher Alegre on 9/30/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import Foundation

struct TopLevelDictionary: Codable {
    /**
     JSON
     success : true
     deck_id : "o7j6smaz1m3e"
     remaining : 51
     cards
     */
    let success: Bool
    let deck_id: String
    let remaining: Int
    let cards: [Card]
}

struct Card: Codable {
    /**
     cards
     value : "5"
     image : "https://deckofcardsapi.com/static/img/5C.png"
     suit : "CLUBS"
     */
    let value: String
    let image: String
    let suit: String
}
