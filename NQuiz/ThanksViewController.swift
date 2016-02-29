//
//  ThanksViewController.swift
//  NQuiz
//
//  Created by Emiliano Bivachi on 28/2/16.
//  Copyright © 2016 Emiliano Bivachi. All rights reserved.
//

import UIKit

class ThanksViewController: UIViewController {
    
    init() {
        super.init(nibName: "ThanksViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        performSelector("dismissMe", withObject: nil, afterDelay: 5.0)
    }
    
    func dismissMe() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func startAgainButtonTouched(sender: AnyObject) {
        dismissMe()
    }
}
