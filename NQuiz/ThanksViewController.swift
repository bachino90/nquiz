//
//  ThanksViewController.swift
//  NQuiz
//
//  Created by Emiliano Bivachi on 28/2/16.
//  Copyright © 2016 Emiliano Bivachi. All rights reserved.
//

import UIKit

class ThanksViewController: UIViewController {
    
    private let answer: String
    @IBOutlet weak var answerLabel: UILabel!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    init(answer: String) {
        self.answer = answer
        super.init(nibName: "ThanksViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = answer
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        performSelector(#selector(ThanksViewController.dismissMe), withObject: nil, afterDelay: 5.0)
    }
    
    func dismissMe() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func startAgainButtonTouched(sender: AnyObject) {
        dismissMe()
    }
}
