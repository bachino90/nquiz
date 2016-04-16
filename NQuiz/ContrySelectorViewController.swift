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
    case Uruguay = "Uruguay"
    case Brasil = "Brasil"
    case Peru = "Peru"
    case Bolivia = "Bolivia"
    case Paraguay = "Paraguay"
    case Colombia = "Colombia"
    case Venezuela = "Venezuela"
    
    var baseLiquidaName: String {
        switch self {
        case .Argentina: return "Base Liquida"
        case .Chile: return ""
        case .Uruguay: return ""
        case .Brasil: return ""
        case .Peru: return ""
        case .Bolivia: return ""
        case .Paraguay: return ""
        case .Colombia: return ""
        case .Venezuela: return ""
        }
    }
    
    var matificName: String {
        switch self {
        case .Argentina: return "Matific"
        case .Chile: return ""
        case .Uruguay: return ""
        case .Brasil: return ""
        case .Peru: return ""
        case .Bolivia: return ""
        case .Paraguay: return ""
        case .Colombia: return ""
        case .Venezuela: return ""
        }
    }
    
    var radianceName: String {
        switch self {
        case .Argentina: return "Radiance"
        case .Chile: return ""
        case .Uruguay: return ""
        case .Brasil: return ""
        case .Peru: return ""
        case .Bolivia: return ""
        case .Paraguay: return ""
        case .Colombia: return ""
        case .Venezuela: return ""
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
