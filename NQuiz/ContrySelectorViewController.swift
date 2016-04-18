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
}

protocol CountrySelectorViewControllerDelegate: class {
    
    func countrySelectorViewController(viewController: CountrySelectorViewController, hasSelectCountry country: String)
}

class CountrySelectorViewController: UIViewController {
    
    weak var delegate: CountrySelectorViewControllerDelegate?
    
    @IBAction func selectedCountry(sender: UIButton) {
        if let countryName = sender.titleLabel?.text {
            CountryManager.sharedManager.country = countryName
            delegate?.countrySelectorViewController(self, hasSelectCountry: countryName)
        }
    }
}
