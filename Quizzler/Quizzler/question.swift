//
//  question.swift
//  Quizzler
//
//  Created by Brenda Boudaie on 6/27/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let questionAnswer : Bool
    
    init(text : String, answer : Bool ) {
        questionText = text
        questionAnswer = answer
    }
}
