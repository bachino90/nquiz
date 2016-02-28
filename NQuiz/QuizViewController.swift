//
//  QuizViewController.swift
//  NQuiz
//
//  Created by Emiliano Bivachi on 28/2/16.
//  Copyright © 2016 Emiliano Bivachi. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let welcome = WelcomeViewController()
        let q1 = QuestionViewController(question: .First)
        let q2 = QuestionViewController(question: .Second)
        let q3 = QuestionViewController(question: .Third)
        let q4 = QuestionViewController(question: .Forth)
        let q5 = QuestionViewController(question: .Fifth)
        

    }
}