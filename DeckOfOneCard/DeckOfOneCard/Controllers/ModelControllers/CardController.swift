//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Christopher Alegre on 9/30/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class CardContrller {
    
    // Create the URL
    /// Define the static and privite cpnstant called baseURL and set its value to the URL and initialized it with a string  - the string is from out API documentation
    private static let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/")
    /// Declared a function called drawCard and pass in two  parameters. The number of cards and a completion block that will complete with an array Card obj
    static func drawACard(numberOfCards: Int, completion: @escaping ((_ card: [Card]) -> Void)) {
        // Step One: Get the URL
        /// Declared a constant called url and asign the value of our baseURL to it. If out baseURL = nil, we will fatality error - this will cause the app to crash. THIS SHOULD NOT HAPPEN - we coded it not to in line 18
        guard let url = self.baseURL else {fatalError("URL optional is nil")}
        /// Decalered a URLCompnents in order to modify and munipulate our URL
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        // Modify the URL with needed information of Query(?) and Components(\)
        /// We declared a constant called cardCQI and asign it to the value of the URLQueryItem using the initalizer that allows us to set the Key and Value of the query Item
        let cardCountQueryItem = URLQueryItem(name: "count", value: "\(numberOfCards)")
        /// Set the cardCQI to query Items array on our components
        components?.queryItems = [cardCountQueryItem]
        /// Set the finalURL with the componets and query items together
        guard let finalURL = components?.url else {return}
        print(finalURL)
     
        // Start the dataTask
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            /// The Completion handler given to us with the DataTask will rerurn with a response,  dont care rn about this, a error - maybe, or data. First goal is to check there was no error.
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")}
            // If there is no error -> then decode
            /// If there is no error - We may have data. Now Guard against there being no data
                guard let data = data else {return}
                /// Now that we know there is Data - initialize an instance of JSONDecoder and attempt to decode the data
                let jsonDecoder = JSONDecoder()
            do {
                //Add a breakpoint before your decode, this will allow you to po <<try _ decode(_:_:)>> and check for bugs (aka: debug URL Keys before you continue)
                /// Attempt to decode the Data into out TopLevelDictionary
                let deck = try jsonDecoder.decode(TopLevelDictionary.self, from: data)
                /// Complete with the .cards value of out deck
                completion(deck.cards)
                /// If this throws an error - catch it and complete with an empty array
            } catch {
                completion([])
                return
            }
        }
        ///Call .resure to Start
        dataTask.resume()
    }
    ///Holy Shit...its the same thing as above...but with an image.
    static func getImage(forURL urlString: String, completion: @escaping (UIImage?) -> Void) {
        //Get URl
        guard let finalURL = URL(string: urlString) else {return}
        //Get the dataTask
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")}
            
            do {
                //Check for data
                guard let data = data else {return}
                //If you have data - get image
                guard let cardImage = UIImage(data: data) else {return}
                completion(cardImage)
            }
        }
        dataTask.resume()
    }
}
