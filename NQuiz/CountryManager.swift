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
    
    let country: String?
    
    init() {
        country = NSUserDefaults.standardUserDefaults().objectForKey(countryKey) as? String
    }
    
    func saveCountry(country: String) {
        NSUserDefaults.standardUserDefaults().setObject(country, forKey: countryKey)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}