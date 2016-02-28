//
//  WelcomeViewController.swift
//  NQuiz
//
//  Created by Emiliano Bivachi on 28/2/16.
//  Copyright © 2016 Emiliano Bivachi. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    init() {
        super.init(nibName: "WelcomeViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func startButtonTouched(sender: AnyObject) {
        if let _ = nameTextField.text {
            
        }
    }
}
