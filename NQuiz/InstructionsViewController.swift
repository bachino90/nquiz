//
//  InstructionsViewController.swift
//  NQuiz
//
//  Created by Emiliano Bivachi on 23/4/16.
//  Copyright © 2016 Emiliano Bivachi. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {
    
    @IBAction func dismissTouched(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }

}