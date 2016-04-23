//
//  ContrySelectorViewController.swift
//  NQuiz
//
//  Created by Emiliano Bivachi on 15/4/16.
//  Copyright © 2016 Emiliano Bivachi. All rights reserved.
//

import Foundation

enum Country: String {
    case Argentina = "Argentina"
    case Chile = "Chile"
    case Peru = "Peru"
    case Colombia = "Colombia"
    case Mexico = "Mexico"
    
    var baseLiquidaName: String {
        switch self {
        case .Argentina: return "base_argentina"
        case .Chile: return "base_chile"
        case .Peru: return "base_peru"
        case .Colombia: return "base_colombia"
        case .Mexico: return "base_mexico"
        }
    }
    
    var matificName: String {
        switch self {
        case .Argentina: return "matific_argentina"
        case .Chile: return "matific_chile"
        case .Peru: return "matific_peru"
        case .Colombia: return "matific_colombia"
        case .Mexico: return "matific_mexico"
        }
    }
    
    var radianceName: String {
        switch self {
        case .Argentina: return "radiance_argentina"
        case .Chile: return "radiance_chile"
        case .Peru: return "radiance_peru"
        case .Colombia: return "radiance_colombia"
        case .Mexico: return "radiance_mexico"
        }
    }
    
    var instructionsImage: UIImage? {
        switch self {
        case .Argentina: return UIImage(named: "instrucciones_arg")
        default: return UIImage(named: "instrucciones")
        }
    }
    
    var tonoImage: UIImage? {
        switch self {
        case .Argentina: return UIImage(named: "tono_arg")
        default: return UIImage(named: "tono")
        }
    }
}

protocol CountrySelectorViewControllerDelegate: class {
    
    func countrySelectorViewController(viewController: CountrySelectorViewController, hasSelectCountry country: String)
}

enum UIUserInterfaceIdiom : Int
{
    case Unspecified
    case Phone
    case Pad
}

struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.mainScreen().bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.mainScreen().bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.currentDevice().userInterfaceIdiom == .Pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
}

class CountrySelectorViewController: UIViewController {
    
    weak var delegate: CountrySelectorViewControllerDelegate?
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
//    @IBOutlet weak var margin1Constraint: NSLayoutConstraint!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if DeviceType.IS_IPHONE_4_OR_LESS {
            bottomConstraint.constant = -130
            widthConstraint.constant = 44
            heightConstraint.constant = 44
//            margin1Constraint.constant = 0
//            margin2Constraint.constant = 15
//            margin3Constraint.constant = 15
        } else if DeviceType.IS_IPHONE_5 {
            bottomConstraint.constant = -153
            widthConstraint.constant = 50
            heightConstraint.constant = 50
//            margin1Constraint.constant = 20
//            margin2Constraint.constant = 20
//            margin3Constraint.constant = 20
        } else if DeviceType.IS_IPHONE_6 {
            bottomConstraint.constant = -180
            widthConstraint.constant = 60
            heightConstraint.constant = 60
//            margin1Constraint.constant = 28
//            margin2Constraint.constant = 28
//            margin3Constraint.constant = 28
        } else if DeviceType.IS_IPHONE_6P {
            widthConstraint.constant = 60
            heightConstraint.constant = 60
//            margin1Constraint.constant = 20
//            margin2Constraint.constant = 20
//            margin3Constraint.constant = 20
        } else if DeviceType.IS_IPAD {
            
        }
    }
    
    @IBAction func selectedCountry(sender: UIButton) {
        if let countryName = sender.titleLabel?.text {
            CountryManager.sharedManager.country = countryName
            delegate?.countrySelectorViewController(self, hasSelectCountry: countryName)
        }
    }
}
