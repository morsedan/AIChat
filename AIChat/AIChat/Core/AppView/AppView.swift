//
//  AppView.swift
//  AIChat
//
//  Created by Morse on 1/9/25.
//

import SwiftUI

// tabbar - signed in
// onboarding - signed out

struct AppView: View {
    
    @AppStorage("showOnboardingView") var showOnboarding = true
    
    var body: some View {
        AppViewBuilder(
            showOnboarding: showOnboarding,
            mainView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .animation(.smooth, value: showOnboarding)
    }
}

#Preview {
    AppView(showOnboarding: false)
}
#Preview {
    AppView(showOnboarding: true)
}
