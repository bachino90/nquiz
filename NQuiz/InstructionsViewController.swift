//
//  InstructionsViewController.swift
//  NQuiz
//
//  Created by Emiliano Bivachi on 23/4/16.
//  Copyright © 2016 Emiliano Bivachi. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {
    
    @IBOutlet weak var backgrounImageView: UIImageView!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    init() {
        super.init(nibName: "InstructionsViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func dismissTouched(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgrounImageView.image = CountryManager.sharedManager.selectedCountry?.instructionsImage
    }

}