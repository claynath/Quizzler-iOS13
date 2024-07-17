//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Nathaniel Clay on 5/28/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    
    var questionNumber = 0
    var currentScore = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            currentScore += 1
            return true
        }
        else {
            return false
        }
    }
    
    mutating func gameReset(_ userAnswer: String) -> Bool {
        if userAnswer == "Start Over?" {
            return true
        }
        else {
            return false
        }
    }
    
    mutating func getQuestionText() -> String {
        if questionNumber < (quiz.count - 1) {
            return quiz[questionNumber].text
        }
        else {
            return "Quiz Done!"
        }
    }
    
    func getChoicesText() -> [String] {
        if questionNumber < (quiz.count - 1) {
            return quiz[questionNumber].choices
        }
        else {
            return ["End Game?", "Start Over?", ""]
        }
    }
    
    func getProgress() -> Float {
        return Float(questionNumber+1)/Float(quiz.count)
    }
    
    mutating func nextQuestion() {
        if questionNumber < (quiz.count - 1) {
            questionNumber += 1
            
        }
        else {
            questionNumber = 0
                        
        }
    }
    
    mutating func getScore() -> Int {
        if questionNumber == 0 {
            currentScore = 0
            return currentScore
        }
        else if questionNumber <= (quiz.count - 1) {
            return currentScore
        }
        else {
            currentScore = 0
            return currentScore
        }
    }
}
