//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionView: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! //True, False
        quizBrain.checkAnswer(userAnswer)
        if userAnswer == actualAnswer {
            questionView.text = "Right!"
            sender.backgroundColor = UIColor.green
        }
        else {
            questionView.text = "Wrong!"
            sender.backgroundColor = UIColor.red
        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            if self.questionNumber < (self.quiz.count - 1) {
//                self.questionNumber += 1
//                self.updateUI()
//            }
//            else {
//                self.questionView.text = "Quiz Done!"
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                    self.questionNumber = 0
//                    self.updateUI()
//                }
//            }
//        }
        
        if self.questionNumber < (self.quiz.count - 1) {
            self.questionNumber += 1
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
        else {
            self.questionView.text = "Quiz Done!"
            self.questionNumber = 0
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
                        
        }
        
    }
    
    @objc func updateUI() {
        progressBar.progress = Float(questionNumber+1)/Float(self.quiz.count)
        questionView.text = quiz[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

