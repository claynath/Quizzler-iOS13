//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Nathaniel Clay on 5/12/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let choices: [String]
    let answer: String
    
    init(q:String, a:[String], correctAnswer:String){
        text = q
        choices = a
        answer = correctAnswer
    }
}
