//
//  AvatarAttributes.swift
//  AIChat
//
//  Created by Morse on 2/1/25.
//

import Foundation

enum CharacterOption: String, CaseIterable, Hashable {
    case man
    case woman
    case alien
    case dog
    case cat
    
    static var `default`: Self {
        .man
    }
    
    var plural: String {
        switch self {
        case .man:
            return "men"
        case .woman:
            return "women"
        case .alien:
            return "aliens"
        case .dog:
            return "dogs"
        case .cat:
            return "cats"
        }
    }
    
    var startsWithVowel: Bool {
        guard let first = rawValue.first else { return false }
        return ["a", "e", "i", "o", "u"].contains(first)
    }
}

enum CharacterAction: String, CaseIterable, Hashable {
    static var `default`: Self {
        .smiling
    }
    
    case smiling
    case sitting
    case eating
    case drinking
    case walking
    case shopping
    case studying
    case working
    case relaxing
    case fighting
    case crying
}

enum CharacterLocation: String, CaseIterable, Hashable {
    static var `default`: Self {
        .park
    }
    
    case park
    case mall
    case museum
    case city
    case desert
    case forrest
    case space
}

struct AvatarDescriptionBuilder {
    let characterOption: CharacterOption
    let characterAction: CharacterAction
    let characterLocation: CharacterLocation
    
    init(characterOption: CharacterOption, characterAction: CharacterAction, characterLocation: CharacterLocation) {
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
    }
    
    init(avatar: AvatarModel) {
        self.characterOption = avatar.characterOption ?? .default
        self.characterAction = avatar.characterAction ?? .default
        self.characterLocation = avatar.characterLocation ?? .default
    }
    
    var characterDescription: String {
        let prefix = characterOption.startsWithVowel ? "An" : "A"
        return "\(prefix) \(characterOption.rawValue) that is \(characterAction.rawValue) in the \(characterLocation.rawValue)"
    }
}
