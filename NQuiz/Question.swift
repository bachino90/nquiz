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
        case .First: return ["Normal a oleosa", "Normal", "Normal a seca"]
        case .Second: return ["Claro", "Medio", "Castaño"]
        case .Third: return ["SI", "NO"]
        case .Forth: return ["Baja", "Media", "Larga"]
        case .Fifth: return ["SI", "NO"]
        }
    }
    
    var colors: [UIColor] {
        return [UIColor.whiteColor(), UIColor.whiteColor(), UIColor.whiteColor()]
    }
    
    var viewControllerNibName: String {
        switch self {
        case .Second: return "AltQuestionViewController"
        default: return "QuestionViewController"
        }
    }
    
    var column: String {
        switch self {
        case .First: return "question1"
        case .Second: return "question2"
        case .Third: return "question3"
        case .Forth: return "question4"
        case .Fifth: return "question5"
        }
    }
    
    var image: UIImage? {
        return UIImage(named: column)
    }
    
    var title: String {
        switch self {
        case .First: return "¿Cómo identificás el tipo de tu piel?"
        case .Second: return "¿Cuál es tu tono de piel?"
        case .Third: return "¿Notás en tu piel la presencia de manchas leves u oscuras?"
        case .Forth: return "¿Cuál es para vos la duración ideal de la base?"
        case .Fifth: return "¿Buscás que la base brinde tratamiento antiseñales?"
        }
    }
    
    var next: Question? {
        switch self {
        case .First: return .Second
        case .Second: return .Third
        case .Third: return .Forth
        case .Forth: return .Fifth
        case .Fifth: return nil
        }
    }
}