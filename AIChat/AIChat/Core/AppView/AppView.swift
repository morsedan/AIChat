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
    
    @State var appState: AppState = AppState()
    
    var body: some View {
        AppViewBuilder(
            showMainView: appState.showMainView,
            mainView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .environment(appState)
    }
}

#Preview {
    AppView(appState: AppState(showTabBar: false))
}
#Preview {
    AppView(appState: AppState(showTabBar: true))
}
