//
//  UserModel.swift
//  AIChat
//
//  Created by Morse on 1/29/25.
//

import SwiftUI

struct UserModel {
    
    let userId: String
    let dateCreated: Date?
    let didCompleteOnboarding: Bool?
    let profileColorHex: String?
    
    var profileColorCalculated: Color {
        guard let profileColorHex else {
            return .accent
        }
        
        return Color(hex: profileColorHex)
    }
    
    init(userId: String, dateCreated: Date? = nil, didCompleteOnboarding: Bool? = nil, profileColorHex: String? = nil) {
        self.userId = userId
        self.dateCreated = dateCreated
        self.didCompleteOnboarding = didCompleteOnboarding
        self.profileColorHex = profileColorHex
    }
    
    static var mock: Self {
        mocks[0]
    }
    
    static var mocks: [Self] {
        return [
            // Mock 1: A user who has completed onboarding, with a profile color
            UserModel(
                userId: "user1",
                dateCreated: .now.addingTimeInterval(days: 1),
                didCompleteOnboarding: true,
                profileColorHex: "#1D77D2" // Example color
            ),
            
            // Mock 2: A user who hasn't completed onboarding and has no profile color
            UserModel(
                userId: "user2",
                dateCreated: .now.addingTimeInterval(days: 3, hours: -1),
                didCompleteOnboarding: false,
                profileColorHex: nil
            ),
            
            // Mock 3: A user with no dateCreated, completed onboarding, and a profile color
            UserModel(
                userId: "user3",
                dateCreated: nil,
                didCompleteOnboarding: true,
                profileColorHex: "#FF5733"
            ),
            
            // Mock 4: A user with no onboarding and no profile color, just userId
            UserModel(
                userId: "user4",
                dateCreated: .now,
                didCompleteOnboarding: nil,
                profileColorHex: nil
            )
        ]
    }
}
