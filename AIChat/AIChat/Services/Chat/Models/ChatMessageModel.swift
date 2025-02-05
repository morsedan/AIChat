//
//  ChatMessageModel.swift
//  AIChat
//
//  Created by Morse on 1/26/25.
//

import Foundation

struct ChatMessageModel: Identifiable {
    let id: String
    let chatId: String
    let authorId: String?
    let content: String?
    let seenByIds: [String]?
    let dateCreated: Date?
    
    init(id: String, chatId: String, authorId: String?, content: String?, seenByIds: [String]?, dateCreated: Date?) {
        self.id = id
        self.chatId = chatId
        self.authorId = authorId
        self.content = content
        self.seenByIds = seenByIds
        self.dateCreated = dateCreated
    }
    
    func hasBeenSeenBy(userId: String) -> Bool {
        guard let seenByIds = seenByIds else { return false }
        
        return seenByIds.contains(userId)
    }
    
    static var mock: Self {
        mocks[0]
    }
    
    static var mocks: [Self] {
        return [
            // Adding time intervals using the extension for ChatMessageModel
            ChatMessageModel(
                id: "msg1",
                chatId: "chat123",
                authorId: "user123",
                content: "Hello!",
                seenByIds: [
                    "user456",
                    "user789"
                ],
                dateCreated: Date()
            ),
            
            ChatMessageModel(
                id: "msg2",
                chatId: "chat123",
                authorId: "user456",
                content: "Hi there!",
                seenByIds: ["user123"],
                dateCreated: Date().addingTimeInterval(
                    days: -1
                )
            ),
            
            ChatMessageModel(
                id: "msg3",
                chatId: "chat456",
                authorId: "user789",
                content: "Good morning!",
                seenByIds: nil,
                dateCreated: Date().addingTimeInterval(
                    days: -2
                )
            ),
            
            ChatMessageModel(
                id: "msg4",
                chatId: "chat101",
                authorId: "user101",
                content: "How are you?",
                seenByIds: [
                    "user123",
                    "user789"
                ],
                dateCreated: Date().addingTimeInterval(
                    days: -3,
                    hours: -2,
                    minutes: -30
                )
            )
        ]
    }
}
