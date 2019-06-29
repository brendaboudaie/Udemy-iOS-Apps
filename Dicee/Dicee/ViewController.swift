//
//  ViewController.swift
//  Dicee
//
//  Created by Brenda Boudaie on 6/24/19.
//  Copyright © 2019 Brenda Boudaie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var diceIndex1 : Int = 0
    var diceIndex2 : Int = 0
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    func updateDiceImage(){
        diceIndex1 = Int(arc4random_uniform(6))
        diceIndex2 = Int(arc4random_uniform(6))
        
//        print("dice 1: " + String(diceIndex1 + 1))
//        print("dice 2: " + String(diceIndex2 + 1))

        diceImage1.image = UIImage(named: diceArray[diceIndex1])
        diceImage2.image = UIImage(named: diceArray[diceIndex2])
    }
    
    @IBOutlet weak var diceImage1: UIImageView!
    @IBOutlet weak var diceImage2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDiceImage()
    }
    
    @IBAction func rollButton(_ sender: UIButton) {
        updateDiceImage()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImage()
    }
    

}

