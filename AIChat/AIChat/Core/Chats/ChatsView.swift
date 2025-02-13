//
//  ChatsView.swift
//  AIChat
//
//  Created by Morse on 1/10/25.
//

import SwiftUI

struct ChatsView: View {
    
    @State private var chats: [ChatModel] = ChatModel.mocks
    @State private var recentAvatars: [AvatarModel] = AvatarModel.mocks
    
    @State private var path: [NavigationPathOption] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(chats) { chat in
                    ChatRowCellViewBuilder(
                        currentUserId: nil, // Add cuid
                        chat: chat,
                        getAvatar: {
                            try? await Task.sleep(for: .seconds(1))
                            return .mock
                        },
                        getLastChatMessage: {
                            try? await Task.sleep(for: .seconds(1))
                            return .mock
                        }
                    )
                    .anyButton(.highlight, action: {
                        onChatTap(chat)
                    })
                    .removeListRowFormatting()
                }
            }
        }
            .navigationTitle("Chats")
            .navigationDestinationForCoreModule(path: $path)
    }
    
    private func onChatTap(_ chat: ChatModel) {
        path.append(.chat(avatarId: chat.avatarid))
    }
}

#Preview {
    ChatsView()
}
