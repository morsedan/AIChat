//
//  ProfileView.swift
//  AIChat
//
//  Created by Morse on 1/10/25.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var showSettingsView = false
    
    var body: some View {
        NavigationStack {
            Text("Profile")
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        settingsButton
                    }
                }
                .sheet(isPresented: $showSettingsView) {
                    SettingsView()
                }
            
        }
    }
    
    private var settingsButton: some View {
        Button {
            onSettingsButtonTap()
        } label: {
            Image(systemName: "gear")
                .font(.headline)
        }
    }
    
    private func onSettingsButtonTap() {
        showSettingsView = true
    }
}

#Preview {
    ProfileView()
}
