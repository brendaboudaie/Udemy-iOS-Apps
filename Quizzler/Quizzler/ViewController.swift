//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var inputAnswer : Bool = true
    var questionNumer = 0
    var score = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let questionOne = allQuestions.list[0]
        questionLabel.text = questionOne.questionText
        
        scoreLabel.text = "score: " + String(0)
        
        progressLabel.text = "0/13"
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            inputAnswer = true;
        }
        else if sender.tag == 2 {
            inputAnswer = false
        }
        
        checkAnswer()
        nextQuestion()
    
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: " + String(score)
        progressLabel.text = String(questionNumer + 1) + "/13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumer + 1)
    }
    

    func nextQuestion() {
        questionNumer += 1
        if questionNumer <= 12 {
            questionLabel.text = allQuestions.list[questionNumer].questionText
            updateUI()
        }
        else {
            let alertController = UIAlertController(title: "Quiz Ended!", message: "Would you like to start over?", preferredStyle: .alert)
            
            let alertRestartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alertController.addAction(alertRestartAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumer].questionAnswer
        if inputAnswer == correctAnswer{
            ProgressHUD.showSuccess()
            score += 1
        }
        else {
            ProgressHUD.showError()
        }
    }
    
    
    func startOver() {
       questionNumer = 0
       questionLabel.text = allQuestions.list[questionNumer].questionText
        
        score = 0
        updateUI()

    }
    

    
}
