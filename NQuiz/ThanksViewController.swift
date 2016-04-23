//
//  ThanksViewController.swift
//  NQuiz
//
//  Created by Emiliano Bivachi on 28/2/16.
//  Copyright © 2016 Emiliano Bivachi. All rights reserved.
//

import UIKit

class ThanksViewController: UIViewController {
    
    private let answerImageName: String
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    init(answerImageName: String) {
        self.answerImageName = answerImageName
        super.init(nibName: "ThanksViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageView.image = UIImage(named: answerImageName)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        performSelector(#selector(ThanksViewController.dismissMe), withObject: nil, afterDelay: 12.0)
    }
    
    func dismissMe() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func startAgainButtonTouched(sender: AnyObject) {
        dismissMe()
    }
}
