//
//  AvatarModel.swift
//  AIChat
//
//  Created by Morse on 1/16/25.
//

import Foundation

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
    
    static var mock: Self {
        mocks[0]
    }
    
    static var mocks: [Self] {
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
