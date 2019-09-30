//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Christopher Alegre on 9/30/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import Foundation

struct TopLevelDictionary: Codable {
    //The Top level dictionary is the first dictionary I expect to decode with my initial data task. To view the JSON hierarchy - test the URL from the API decumentation and checking in a JSON viewer
    let cards: [Card]
}

struct Card: Codable {
    //This image String is the string representation of the URL where the card image is found - Need card before was can access this property
    let image: String
}
