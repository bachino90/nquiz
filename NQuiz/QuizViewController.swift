//
//  QuizViewController.swift
//  NQuiz
//
//  Created by Emiliano Bivachi on 28/2/16.
//  Copyright © 2016 Emiliano Bivachi. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    let pageController: UIPageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let welcome = WelcomeViewController()
        let q1 = QuestionViewController(question: .First)
        let q2 = QuestionViewController(question: .Second)
        let q3 = QuestionViewController(question: .Third)
        let q4 = QuestionViewController(question: .Forth)
        let q5 = QuestionViewController(question: .Fifth)
        
        pageController.setViewControllers([welcome], direction: .Reverse, animated: true, completion: nil)

    }
}

//extension QuizViewController: UIPageViewControllerDataSource {
//    
//}