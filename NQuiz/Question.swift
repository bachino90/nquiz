//
//  Question.swift
//  NQuiz
//
//  Created by Emiliano Bivachi on 28/2/16.
//  Copyright © 2016 Emiliano Bivachi. All rights reserved.
//

import Foundation

enum Question {
    case First
    case Second
    case Third
    case Forth
    case Fifth
    
    var options: [String] {
        switch self {
        case .First: return ["Mixta a oleosa", "Normal", "Normal a seca"]
        case .Second: return ["Clara", "Media", "Castaña"]
        case .Third: return ["Si", "No"]
        case .Forth: return ["Corta", "Media", "Larga"]
        case .Fifth: return ["Si", "No"]
        }
    }
    
    var title: String {
        switch self {
        case .First: return "¿Cómo identificarías el tipo de tu piel?"
        case .Second: return "¿Cuál es el tono de tu piel?"
        case .Third: return "¿Notás en tu piel la presencia de manchas leves u oscuras?"
        case .Forth: return "¿Cuál es para vos la duración ideal de la base?"
        case .Fifth: return "¿Buscás que la base brinde tratamiento antiseñales?"
        }
    }
}