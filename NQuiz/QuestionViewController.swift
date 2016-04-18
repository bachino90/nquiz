//
//  QuestionViewController.swift
//  NQuiz
//
//  Created by Emiliano Bivachi on 28/2/16.
//  Copyright © 2016 Emiliano Bivachi. All rights reserved.
//

import UIKit

protocol QuestionViewControllerDelegate: class {
    func questionViewController(questionViewController: QuestionViewController, hasAnswered answer: String, forQuestion question: Question)
}

class QuestionViewController: UIViewController {
    
    weak var delegate: QuestionViewControllerDelegate?
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var buttonOne: UIButton!
    @IBOutlet private weak var buttonTwo: UIButton!
    @IBOutlet private weak var buttonThree: UIButton!
    @IBOutlet private weak var buttonThreeWidtConstraint: NSLayoutConstraint!
    @IBOutlet private weak var buttonThreeLeftMarginConstraint: NSLayoutConstraint!
    @IBOutlet private var colorPaletViews: [UIView]!
    
    private let question: Question
    
    init(question: Question) {
        self.question = question
        super.init(nibName: question.viewControllerNibName, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        questionLabel.text = question.title
//        buttonOne.layer.cornerRadius = buttonOne.frame.width/2
//        buttonTwo.layer.cornerRadius = buttonTwo.frame.width/2
//        buttonThree.layer.cornerRadius = buttonThree.frame.width/2
//        for view in (colorPaletViews ?? []) {
//            view.layer.cornerRadius = view.frame.width/2
//        }
        
        backgroundImageView.image = question.image
        
        let options = question.options
        let colors = question.colors
        buttonOne.setTitle(options[0], forState: .Normal)
        buttonOne.backgroundColor = colors[0]
        buttonTwo.setTitle(options[1], forState: .Normal)
        buttonTwo.backgroundColor = colors[1]
        if options.count == 3 {
            buttonThree.setTitle(options[2], forState: .Normal)
            buttonThree.backgroundColor = colors[2]
        } else {
            buttonThree.hidden = true
            buttonThreeWidtConstraint.constant = 0
            buttonThreeLeftMarginConstraint.constant = 0
        }
    }
    
    @IBAction func optionButtonTouched(sender: UIButton) {
        let optionSelected = question.options[sender.tag]
        delegate?.questionViewController(self, hasAnswered: optionSelected, forQuestion: question)
    }
}
