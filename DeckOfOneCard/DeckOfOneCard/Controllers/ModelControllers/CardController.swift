//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Christopher Alegre on 9/30/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class CardContrller {
    
    // Step 1 - Create the URL
    private static let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/")
    
    //MARK:- 
    static func drawACard(numberOfCards: Int, completion: @escaping ((_ card: [Card]) -> Void)) {
        
        // Get the URL
        guard let url = self.baseURL else {fatalError("URL optional is nil")}
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        // Modify the URL with needed information of Query(?) and Components(\)
        let cardCountQueryItem = URLQueryItem(name: "count", value: "\(numberOfCards)")
        components?.queryItems = [cardCountQueryItem]
        
        guard let finalURL = components?.url else {return}
        print(finalURL)
     
        // Start the dataTask
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")}
            
            // If there is no error -> then decode
            do {
                guard let data = data else {return}
                let jsonDecoder = JSONDecoder()
            //Add a breakpoint before your decode, this will allow you to po <<try _ decode(_:_:)>> and check for bugs (aka: debug URL Keys before you continue)
                let deck = try! jsonDecoder.decode(TopLevelDictionary.self, from: data)
                completion(deck.cards)
            } catch {
                completion([])
                return
            }
        }
        dataTask.resume()
    }
    
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
