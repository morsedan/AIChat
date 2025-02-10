//
//  ChatBubbleView.swift
//  AIChat
//
//  Created by Morse on 2/3/25.
//

import SwiftUI

struct ChatBubbleView: View {
    
    var text: String = "This is sample text."
    var textColor: Color = .primary
    var backgroundColor: Color = Color(uiColor: .systemGray6)
    var showImage: Bool = true
    var imageName: String?
    var onImageTap: (() -> Void)?
    
    let offset: CGFloat = 14
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            if showImage {
                ZStack {
                    if let imageName {
                        ImageLoaderView(urlString: imageName)
                            .anyButton {
                                onImageTap?()
                            }
                    } else {
                        Rectangle()
                            .fill(.secondary)
                    }
                }
                .frame(width: 45, height: 45)
                .clipShape(Circle())
                .offset(y: offset)
            }
            Text(text)
                .font(.body)
                .foregroundStyle(textColor)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(backgroundColor)
                .cornerRadius(6)
        }
        .padding(.bottom, showImage ? offset : 0)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 16) {
            ChatBubbleView()
            ChatBubbleView(text: "This is a chat bubble with multiple lines of text. This is a chat bubble with multiple lines of text. This is a chat bubble with multiple lines of text.")
            
            ChatBubbleView(
                textColor: .white,
                backgroundColor: .accent,
                showImage: false,
                imageName: nil
            )
            ChatBubbleView(
                text: "This is a chat bubble with multiple lines of text. This is a chat bubble with multiple lines of text. This is a chat bubble with multiple lines of text.",
                textColor: .white,
                backgroundColor: .accent,
                showImage: false,
                imageName: nil
            )
        }
        .padding(8)
    }
}
