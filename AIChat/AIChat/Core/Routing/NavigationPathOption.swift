//
//  NavigationPathOption.swift
//  AIChat
//
//  Created by Morse on 2/11/25.
//

import SwiftUI

enum NavigationPathOption: Hashable {
    case chat(avatarId: String)
    case category(category: CharacterOption, imageName: String)
}

extension View {
    func navigationDestinationForCoreModule(path: Binding<[NavigationPathOption]>) -> some View {
        self
            .navigationDestination(for: NavigationPathOption.self) { newValue in
                switch newValue {
                case .chat(let avatarId):
                    ChatView(avatarId: avatarId)
                case .category(let category, let imageName):
                    CategoryListView(path: path, category: category, imageName: imageName)
                }
            }
    }
}
