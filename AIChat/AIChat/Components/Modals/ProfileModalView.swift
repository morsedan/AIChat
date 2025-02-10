//
//  ProfileModalView.swift
//  AIChat
//
//  Created by Morse on 2/9/25.
//

import SwiftUI

struct ProfileModalView: View {
    
    var imageName: String? = Constants.randomImage
    var title: String? = "Alpha"
    var subtitle: String? = "Alien"
    var headline: String? = "An alien in the park"
    var onXMarkTap: () -> Void = { }
    
    var body: some View {
        VStack(spacing: 0) {
            if let imageName {
                ImageLoaderView(
                    urlString: imageName,
                    forceTransitionAnimation: true
                )
                    .aspectRatio(1, contentMode: .fit)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                if let title {
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                if let subtitle {
                    Text(subtitle)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
                if let headline {
                    Text(headline)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(.thinMaterial)
        .cornerRadius(16)
        .overlay(
            Image(systemName: "xmark.circle.fill")
                .font(.title)
                .padding(4)
                .foregroundColor(Color.black)
                .tappableBackground()
                .padding(8)
                .anyButton {
                    onXMarkTap()
                }
            
            , alignment: .topTrailing
        )
    }
}

#Preview("Modal with Image") {
    ZStack {
        Color.gray.ignoresSafeArea()
        
        ProfileModalView()
            .padding(40)
    }
}

#Preview("Modal w/o Image") {
    ZStack {
        Color.gray.ignoresSafeArea()
        
        ProfileModalView(imageName: nil)
            .padding(40)
    }
}
