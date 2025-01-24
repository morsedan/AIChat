//
//  AvatarModel.swift
//  AIChat
//
//  Created by Morse on 1/16/25.
//

import Foundation

enum CharacterOption: String, CaseIterable, Hashable {
    static var `default`: Self {
        .man
    }
    
    case man
    case woman
    case alien
    case dog
    case cat
}

enum CharacterAction: String {
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

enum CharacterLocation: String {
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

struct AvatarModel: Hashable {
    let avatarID: String
    let name: String?
    let characterOption: CharacterOption?
    let characterAction: CharacterAction?
    let characterLocation: CharacterLocation?
    let profileImageName: String?
    let authorID: String?
    let dateCreated: Date?
    
    init(
        avatarID: String,
        name: String? = nil,
        characterOption: CharacterOption? = nil,
        characterAction: CharacterAction? = nil,
        characterLocation: CharacterLocation? = nil,
        profileImageName: String? = nil,
        authorID: String? = nil,
        dateCreated: Date? = nil
    ) {
        self.avatarID = avatarID
        self.name = name
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
        self.profileImageName = profileImageName
        self.authorID = authorID
        self.dateCreated = dateCreated
    }
    
    var characterDescription: String {
        AvatarDescriptionBuilder(avatar: self).characterDescription
    }
    
    static var mock: AvatarModel {
        mocks[0]
    }
    
    static var mocks: [AvatarModel] {
        [
            AvatarModel(
                avatarID: UUID().uuidString,
                name: "Alpha",
                characterOption: .alien,
                characterAction: .smiling,
                characterLocation: .park,
                profileImageName: Constants.randomImage,
                authorID: UUID().uuidString,
                dateCreated: .now
            ),
            AvatarModel(
                avatarID: UUID().uuidString,
                name: "Beta",
                characterOption: .dog,
                characterAction: .eating,
                characterLocation: .forrest,
                profileImageName: Constants.randomImage,
                authorID: UUID().uuidString,
                dateCreated: .now
            ),
            AvatarModel(
                avatarID: UUID().uuidString,
                name: "Gamma",
                characterOption: .cat,
                characterAction: .drinking,
                characterLocation: .museum,
                profileImageName: Constants.randomImage,
                authorID: UUID().uuidString,
                dateCreated: .now
            ),
            AvatarModel(
                avatarID: UUID().uuidString,
                name: "Delta",
                characterOption: .woman,
                characterAction: .shopping,
                characterLocation: .park,
                profileImageName: Constants.randomImage,
                authorID: UUID().uuidString,
                dateCreated: .now
            )
        ]
    }
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
        "A \(characterOption.rawValue) that is \(characterAction.rawValue) in the \(characterLocation.rawValue)"
    }
}
