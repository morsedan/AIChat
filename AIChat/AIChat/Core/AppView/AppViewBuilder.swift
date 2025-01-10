//
//  AppViewBuilder.swift
//  AIChat
//
//  Created by Morse on 1/9/25.
//

import SwiftUI

struct AppViewBuilder<MainView: View, OnboardingView: View>: View {
    
    var showOnboarding = true
    @ViewBuilder var mainView: MainView
    @ViewBuilder var onboardingView: OnboardingView
    
    var body: some View {
        ZStack {
            if showOnboarding {
                onboardingView
                    .transition(.move(edge: .leading))
            } else {
                mainView
                    .transition(.move(edge: .trailing))
            }
        }
        .animation(.smooth, value: showOnboarding)
    }
}

struct PreviewView: View {
    @State private var showOnboarding = true
    
    var body: some View {
        AppViewBuilder(
            showOnboarding: showOnboarding,
            mainView: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("TabBar")
                }
            },
            onboardingView: {
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Onboarding")
                }
            }
        )
        .animation(.smooth, value: showOnboarding)
        .onTapGesture {
            showOnboarding.toggle()
        }
    }
}

#Preview {
    PreviewView()
}
