//
//  ChatsView.swift
//  AIChat
//
//  Created by Morse on 1/10/25.
//

import SwiftUI

struct ChatsView: View {
    
    @State private var chats: [ChatModel] = ChatModel.mocks
    var body: some View {
        NavigationStack {
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
                        
                    })
                    .removeListRowFormatting()
                }
            }
        }
            .navigationTitle("Chats")
    }
}

#Preview {
    ChatsView()
}
