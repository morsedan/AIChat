//
//  TextValidationHelper.swift
//  AIChat
//
//  Created by Morse on 2/7/25.
//

import Foundation

struct TextValidationHelper {
    enum TextValidationError: LocalizedError {
        case notEnoughCharacters(min: Int)
        case hasBadWords
        
        var errorDescription: String? {
            switch self {
            case .notEnoughCharacters(min: let min):
                return "Please add at least \(min) characters."
            case .hasBadWords:
                return "Bad word detected. Please rephrase your message"
            }
        }
    }
    
    static func checkIfTextIsValid(text: String) throws {
        let minimumCharacterCount = 3
        let badWords: [String] = ["bitch", "shit", "ass"]
        
        if text.count < minimumCharacterCount {
            throw TextValidationError.notEnoughCharacters(min: minimumCharacterCount)
        }
        
        if badWords.contains(text.lowercased()) {
            throw TextValidationError.hasBadWords
        }
    }
}
