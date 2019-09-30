//
//  CardViewController.swift
//  DeckOfOneCard
//
//  Created by Christopher Alegre on 9/30/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    //MARK:- Outputs
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var chooseCardButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        designCardButton()
        drawACard()
    }
    //MARK:- Actions
    @IBAction func cardButtonTapped(_ sender: UIButton) {
        drawACard()
    }
    
//MARK:- Helper Function
    func drawACard() {
        CardContrller.drawACard(numberOfCards: 1) { (cards) in
            let card = cards[0]
            CardContrller.getImage(forURL: card.image) { (image) in
                guard let image = image else {return}
                DispatchQueue.main.async {
                
                self.cardImage.image = image
                }
            }
        }
    }
    
    func designCardButton() {
        chooseCardButton.layer.borderWidth = 2
        chooseCardButton.layer.borderColor = UIColor.black.cgColor
        chooseCardButton.layer.cornerRadius = chooseCardButton.frame.height / 2
        chooseCardButton.setTitle("Draw A Card", for: .normal)
        chooseCardButton.backgroundColor = .black
        chooseCardButton.setTitleColor(.white, for: .normal)
    }
}
