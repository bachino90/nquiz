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
    
    private var country: Country = .Argentina
    private var game = Game()
    
    override func prefersStatusBarHidden() -> Bool { return true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewController(pageController)
        view.addSubview(pageController.view)
        view.clipsToBounds = true
        MiscUtils.addConstraintsToMatchItsSuperView(pageController.view)
        pageController.didMoveToParentViewController(self)
        
        indexChangeBlock(.First)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if CountryManager.sharedManager.country == nil {
            let countrySelectorVC = CountrySelectorViewController()
            countrySelectorVC.delegate = self
            presentViewController(countrySelectorVC, animated: false, completion: nil)
        }
    }
    
    private func showThanks() {
        if let answer = game.answer {
            presentViewController(ThanksViewController(answer: answer), animated: true) { [weak self] in
                if let strongSelf = self {
                    strongSelf.game = Game()
                    strongSelf.indexChangeBlock(.First)
                }
            }
        }

    }
    
    private func indexChangeBlock(next: Question) {
        let vc = QuestionViewController(question: next)
        vc.delegate = self
        pageController.setViewControllers([vc], direction: .Forward, animated: true, completion: nil)
    }
}

extension QuizViewController: CountrySelectorViewControllerDelegate {
    
    func countrySelectorViewController(viewController: CountrySelectorViewController, hasSelectCountry country: String) {
        self.country = Country(rawValue: country) ?? .Argentina
        dismissViewControllerAnimated(true, completion: nil)
    }
}

extension QuizViewController: QuestionViewControllerDelegate {
    func questionViewController(questionViewController: QuestionViewController, hasAnswered answer: String, forQuestion question: Question) {
        game.responses[question] = answer
        if let next = question.next {
            indexChangeBlock(next)
        } else {
            showThanks()
        }
    }
}

extension QuizViewController: WelcomeViewControllerDelegate {
    func welcomeViewController(welcomeViewController: WelcomeViewController, hasStartedWithName name: String) {
        indexChangeBlock(.First)
    }
}