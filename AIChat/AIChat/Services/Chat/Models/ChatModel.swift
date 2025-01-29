//
//  ChatModel.swift
//  AIChat
//
//  Created by Morse on 1/26/25.
//

import Foundation

struct ChatModel: Identifiable {
    let id: String
    let userId: String
    let avatarid: String
    let dateCreated: Date
    let dateModified: Date
    
    internal init(id: String, userId: String, avatarid: String, dateCreated: Date, dateModified: Date) {
        self.id = id
        self.userId = userId
        self.avatarid = avatarid
        self.dateCreated = dateCreated
        self.dateModified = dateModified
    }
    
    static var mock: Self {
        mocks[0]
    }
    
    static var mocks: [Self] {
        return [
            ChatModel(id: "mock_chat_1", userId: "user123", avatarid: "avatar1",
                      dateCreated: Date(),
                      dateModified: Date()),
            
            // Adding time intervals using the extension
            ChatModel(id: "mock_chat_2", userId: "user456", avatarid: "avatar2",
                      dateCreated: Date().addingTimeInterval(days: -1),
                      dateModified: Date()),
            
            ChatModel(id: "mock_chat_3", userId: "user789", avatarid: "avatar3",
                      dateCreated: Date().addingTimeInterval(days: -2),
                      dateModified: Date()),
            
            ChatModel(id: "mock_chat_4", userId: "user101", avatarid: "avatar4",
                      dateCreated: Date().addingTimeInterval(days: -3, hours: -2, minutes: -30),
                      dateModified: Date())
        ]
    }
}
