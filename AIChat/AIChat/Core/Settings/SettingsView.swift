//
//  SettingsView.swift
//  AIChat
//
//  Created by Morse on 1/11/25.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(AppState.self) private var appState
    
    var body: some View {
        NavigationStack {
            List {
                Button {
                    onSignOutTap()
                } label: {
                    Text(("Sign Out"))
                }
            }
        }
    }
    
    func onSignOutTap() {
        // add logic to sign user out of app
        
        dismiss()
        
        Task {
            try? await Task.sleep(for: .seconds(0.4))
            appState.updateViewState(showMainView: false)
        }
    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
