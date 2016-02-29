//
//  WelcomeViewController.swift
//  NQuiz
//
//  Created by Emiliano Bivachi on 28/2/16.
//  Copyright © 2016 Emiliano Bivachi. All rights reserved.
//

import UIKit

protocol WelcomeViewControllerDelegate: class {
    func welcomeViewController(welcomeViewController: WelcomeViewController, hasStartedWithName name: String)
}

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    weak var delegate: WelcomeViewControllerDelegate?
    
    init() {
        super.init(nibName: "WelcomeViewController", bundle: nil)
        view.backgroundColor = UIColor.redColor()   
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reset() {
        nameTextField.text = ""
    }
    
    @IBAction func startButtonTouched(sender: AnyObject) {
        if let name = nameTextField.text {
            delegate?.welcomeViewController(self, hasStartedWithName: name)
        }
    }
}

extension WelcomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
}
