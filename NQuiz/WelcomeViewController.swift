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
    
    lazy var hideKeyboardGestureRecognizer: UITapGestureRecognizer = {
        return UITapGestureRecognizer(target: self, action: "hideKeyboard:")
    }()
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    init() {
        super.init(nibName: "WelcomeViewController", bundle: nil)
        view.backgroundColor = UIColor.redColor()   
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hideKeyboard(gesture: UIGestureRecognizer) {
        nameTextField.resignFirstResponder()
    }
    
    func reset() {
        nameTextField.text = "Ingresá tu nombre y apellido"
    }
    
    @IBAction func startButtonTouched(sender: AnyObject) {
        if let name = nameTextField.text where name != "" && name != "Ingresá tu nombre y apellido" {
            nameTextField.resignFirstResponder()
            delegate?.welcomeViewController(self, hasStartedWithName: name)
        }
    }
}

extension WelcomeViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(textField: UITextField) {
        view.addGestureRecognizer(hideKeyboardGestureRecognizer)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        view.gestureRecognizers = []
        return true
    }
}
