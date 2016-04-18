//
//  Question.swift
//  NQuiz
//
//  Created by Emiliano Bivachi on 28/2/16.
//  Copyright © 2016 Emiliano Bivachi. All rights reserved.
//

import Foundation

class Game {
    var responses: [Question: String] = [:]
    
    var answer: String? {
        if responses.count == 4 {
            if responses[.First] == "NORMAL SECA" {
                return CountryManager.sharedManager.selectedCountry?.radianceName
            }
            if responses[.First] == "NORMAL OLEOSA" && responses[.Second] == "MEDIA" && responses[.Third] == "NO" && responses[.Forth] == "NO" {
               return CountryManager.sharedManager.selectedCountry?.matificName
            }
            if responses[.First] == "NORMAL OLEOSA" && responses[.Second] == "NO ES EL PRINCIPAL BENEFICIO BUSCADO" && responses[.Third] == "NO" && responses[.Forth] == "NO" {
                return CountryManager.sharedManager.selectedCountry?.matificName
            }
            return CountryManager.sharedManager.selectedCountry?.baseLiquidaName
        }
        return nil
    }
}

enum Question {
    case First
    case Second
    case Third
    case Forth
//    case Fifth
    
    var options: [String] {
        switch self {
        case .First: return ["NORMAL", "NORMAL SECA", "NORMAL OLEOSA"]
        case .Second: return ["ALTA", "MEDIA", "NO ES EL PRINCIPAL BENEFICIO BUSCADO"]
        case .Third: return ["SI", "NO"]
        case .Forth: return ["SI", "NO"]
//        case .Fifth: return ["SI", "NO"]
        }
    }
    
    var colors: [UIColor] {
        return [UIColor.clearColor(), UIColor.clearColor(), UIColor.clearColor()]
    }
    
    var viewControllerNibName: String {
//        switch self {
//        case .Second: return "AltQuestionViewController"
//        default: return "QuestionViewController"
//        }        
        return "QuestionViewController"
    }
    
    var column: String {
        switch self {
        case .First: return "question1"
        case .Second: return "question2"
        case .Third: return "question3"
        case .Forth: return "question4"
//        case .Fifth: return "question5"
        }
    }
    
    var image: UIImage? {
        return UIImage(named: column)
    }
    
    var title: String {
        switch self {
        case .First: return "¿Cómo identificas tu tipo de de piel?"
        case .Second: return "¿Cuál es para ti la duración ideal de la base?"
        case .Third: return "¿Buscás que la base brinde tratamiento antiseñales?"
        case .Forth: return "¿Notás en tu piel manchas oscuras?"
//        case .Fifth: return "¿Notás en tu piel manchas oscuras?"
        }
    }
    
    var next: Question? {
        switch self {
        case .First: return .Second
        case .Second: return .Third
        case .Third: return .Forth
        case .Forth: return nil
//        case .Fifth: return nil
        }
    }
}