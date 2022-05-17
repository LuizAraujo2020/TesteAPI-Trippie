//
//  ServiceUnsplashError.swift
//  Trippie
//
//  Created by Thiele Oliveira on 17/05/22.
//

import Foundation

enum ServiceUnsplashError: LocalizedError {
    case urlNil
    case dataNil
    case parseFailure
    
    var errorDescription: String? {
        switch self {
        case .urlNil:
            return "URL não encontrada!"
        case .dataNil:
            return "Download não encontrado!"
        case .parseFailure:
            return "Dados inválidos!"
        }
    }
}
