//
//  AppViewBuilder.swift
//  AIChat
//
//  Created by Morse on 1/9/25.
//

import SwiftUI

struct AppViewBuilder<MainView: View, OnboardingView: View>: View {
    
    var showMainView = false
    @ViewBuilder var mainView: MainView
    @ViewBuilder var onboardingView: OnboardingView
    
    var body: some View {
        ZStack {
            if showMainView {
                mainView
                    .transition(.move(edge: .trailing))
            } else {
                onboardingView
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.smooth, value: showMainView)
    }
}

struct PreviewView: View {
    @State private var showMainView = true
    
    var body: some View {
        AppViewBuilder(
            showMainView: showMainView,
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
        .animation(.smooth, value: showMainView)
        .onTapGesture {
            showMainView.toggle()
        }
    }
}

#Preview {
    PreviewView()
}
