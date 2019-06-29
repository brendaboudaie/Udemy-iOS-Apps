//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Brenda Boudaie on 6/25/19.
//  Copyright © 2019 Brenda Boudaie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballImage: UIImageView!
    
    var ballIndex = 0;
    let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]

    func updateBallImage(){
        ballIndex = Int(arc4random_uniform(5))
        print(ballIndex)
        
        ballImage.image = UIImage(named: ballArray[ballIndex])
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateBallImage()
    }
    
    @IBAction func shakePressed(_ sender: UIButton) {
        updateBallImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBallImage()
    }


}

