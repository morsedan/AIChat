//
//  OnboardingCompletedView.swift
//  AIChat
//
//  Created by Morse on 1/11/25.
//

import SwiftUI

struct OnboardingCompletedView: View {
    
    @Environment(AppState.self) private var root
    
    var body: some View {
        VStack {
            Text("Onboarding Completed")
                .frame(maxHeight: .infinity)
            
            Button {
                onFinishButtonTap()
            } label: {
                Text("Finish")
                    .callToActionButton()
            }
        }
        .padding(16)
    }
    
    func onFinishButtonTap() {
        // other logic to complete onboarding to come
        root.updateViewState(showMainView: true)
    }
}

#Preview {
    OnboardingCompletedView()
        .environment(AppState())
}
