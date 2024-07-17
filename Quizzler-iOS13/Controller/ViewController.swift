//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionView: UILabel!
    @IBOutlet weak var Choice1: UIButton!
    @IBOutlet weak var Choice2: UIButton!
    @IBOutlet weak var Choice3: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
        @IBAction func answerButtonPressed(_ sender: UIButton) {
            if quizBrain.getQuestionText() != "Quiz Done!" {
                let userAnswer = sender.currentTitle! //True, False
                let userGotItRight = quizBrain.checkAnswer(userAnswer)
                if userGotItRight {
                    questionView.text = "Right!"
                    sender.backgroundColor = UIColor.green
                    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
                    quizBrain.nextQuestion()
                }
                else {
                    questionView.text = "Wrong!"
                    sender.backgroundColor = UIColor.red
                    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
                    quizBrain.nextQuestion()
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
                
            } else {
                let userAnswer = sender.currentTitle! //True, False
                let userChoice = quizBrain.gameReset(userAnswer)
                if userChoice {
                    questionView.text = "Let's Go!"
                    sender.backgroundColor = UIColor.green
                    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
                    quizBrain.nextQuestion()
                }
                else {
                    questionView.text = "Ok, see You Next Time! Press Start Over if you would like to restart."
                    sender.backgroundColor = UIColor.green
                }
            }
        }
    
    @objc func updateUI() {
            progressBar.progress = quizBrain.getProgress()
            questionView.text = quizBrain.getQuestionText()
            Choice1.setTitle(quizBrain.getChoicesText()[0], for: .normal)
            Choice2.setTitle(quizBrain.getChoicesText()[1], for: .normal)
            Choice3.setTitle(quizBrain.getChoicesText()[2], for: .normal)
            scoreLabel.text = "Score: \(quizBrain.getScore())"
            Choice1.backgroundColor = UIColor.clear
            Choice2.backgroundColor = UIColor.clear
            Choice3.backgroundColor = UIColor.clear
    }
    
}

