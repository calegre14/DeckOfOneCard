//
//  CardViewController.swift
//  DeckOfOneCard
//
//  Created by Christopher Alegre on 9/30/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var chooseCardButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        designCardButton()
       
    }
    
    @IBAction func cardButtonTapped(_ sender: UIButton) {
    }
    
//MARK:- Helper Function
    
    func designCardButton() {
        chooseCardButton.layer.borderWidth = 2
        chooseCardButton.layer.borderColor = UIColor.black.cgColor
        chooseCardButton.layer.cornerRadius = chooseCardButton.frame.height / 2
        chooseCardButton.setTitle("Draw A Card", for: .normal)
        chooseCardButton.backgroundColor = .black
        chooseCardButton.setTitleColor(.white, for: .normal)
    }
    
}
