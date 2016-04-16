//
//  CountryManager.swift
//  NQuiz
//
//  Created by Emiliano Bivachi on 15/4/16.
//  Copyright © 2016 Emiliano Bivachi. All rights reserved.
//

import Foundation

let countryKey = "com.nquiz.country"

class CountryManager {
    
    static let sharedManager = CountryManager()
    var selectedCountry: Country? { return Country(rawValue: self.country ?? "") }
    var country: String? {
        didSet {
            if let countryName = country {
                saveCountry(countryName)
            }
        }
    }
    
    init() {
        country = NSUserDefaults.standardUserDefaults().objectForKey(countryKey) as? String
    }
    
    func saveCountry(country: String) {
        NSUserDefaults.standardUserDefaults().setObject(country, forKey: countryKey)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}