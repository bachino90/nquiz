//
//  QuestionViewController.swift
//  NQuiz
//
//  Created by Emiliano Bivachi on 28/2/16.
//  Copyright © 2016 Emiliano Bivachi. All rights reserved.
//

import UIKit



class QuestionViewController: UIViewController {
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var buttonOne: UIButton!
    @IBOutlet private weak var buttonTwo: UIButton!
    @IBOutlet private weak var buttonThree: UIButton!
    
    private let question: Question
    
    init(question: Question) {
        self.question = question
        super.init(nibName: "QuestionViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let options = question.options
        
        buttonOne.setTitle(options[0], forState: .Normal)
        buttonTwo.setTitle(options[1], forState: .Normal)
        if options.count == 3 {
            buttonThree.setTitle(options[2], forState: .Normal)
        } else {
            buttonThree.hidden = true
        }
    }
}
