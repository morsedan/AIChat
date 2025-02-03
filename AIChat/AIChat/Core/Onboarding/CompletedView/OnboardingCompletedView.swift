//
//  OnboardingCompletedView.swift
//  AIChat
//
//  Created by Morse on 1/11/25.
//

import SwiftUI

struct OnboardingCompletedView: View {
    
    @Environment(AppState.self) private var root
    
    @State private var isCompletingProfileSetup: Bool = false
    var selectedColor: Color = .orange
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Setup Complete!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(selectedColor)
            Text("We've set up your profile and you're ready to start chatting!")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom, content: {
            AsyncCallToActionButton(
                isLoading: $isCompletingProfileSetup,
                title: "Finish",
                action: onFinishButtonTap)
        })
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)
    }
    
    func onFinishButtonTap() {
        isCompletingProfileSetup = true
        Task {
            try await Task.sleep(for: .seconds(0.8))
            isCompletingProfileSetup = false
            
            root.updateViewState(showMainView: true)
        }
    }
}

#Preview {
    OnboardingCompletedView(selectedColor: .mint)
        .environment(AppState())
}
