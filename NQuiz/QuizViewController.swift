//
//  QuizViewController.swift
//  NQuiz
//
//  Created by Emiliano Bivachi on 28/2/16.
//  Copyright © 2016 Emiliano Bivachi. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    private let pageController: UIPageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
    
    private var participant = PFObject(className: "Participant")
    
    private let welcome = WelcomeViewController()
    private let q1 = QuestionViewController(question: .First)
    private let q2 = QuestionViewController(question: .Second)
    private let q3 = QuestionViewController(question: .Third)
    private let q4 = QuestionViewController(question: .Forth)
    private let q5 = QuestionViewController(question: .Fifth)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageController.setViewControllers([welcome], direction: .Reverse, animated: true, completion: nil)
        addChildViewController(pageController)
        view.addSubview(pageController.view)
        view.clipsToBounds = true
        MiscUtils.addConstraintsToMatchItsSuperView(pageController.view)
        pageController.didMoveToParentViewController(self)
    }
    
    private func resetQuiz() {
        presentViewController(ThanksViewController(), animated: true) { [weak self] in
            if let strongSelf = self {
                strongSelf.participant = PFObject(className: "Participant")
                strongSelf.welcome.reset()
                strongSelf.pageController.setViewControllers([strongSelf.welcome], direction: .Reverse, animated: false, completion: nil)
            }
            
        }
    }
    
    private func saveParticipant() {
        participant.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
    }
    
    private func indexChangeBlock(index: Int) {
        let vc = QuestionViewController(question: .First)
        pageController.setViewControllers([vc], direction: .Reverse, animated: true, completion: nil)
    }
}

extension QuizViewController: QuestionViewControllerDelegate {
    func questionViewController(questionViewController: QuestionViewController, hasAnswered answer: String, forQuestion question: Question) {
        participant[question.column] = answer
        // pasar al siguiente
    }
}

extension QuizViewController: WelcomeViewControllerDelegate {
    func welcomeViewController(welcomeViewController: WelcomeViewController, hasStartedWithName name: String) {
        participant["name"] = name
        // pasar al siguiente
    }
}