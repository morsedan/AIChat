//
//  AsyncCallToActionButton.swift
//  AIChat
//
//  Created by Morse on 2/1/25.
//

import SwiftUI

struct AsyncCallToActionButton: View {
    
    @Binding var isLoading: Bool
    var title: String = "Save"
    var action: () -> Void
    
    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
                    .tint(.white)
            } else {
                Text(title)
            }
        }
        .callToActionButton()
        .anyButton(.press) {
            action()
        }
        .disabled(isLoading)
    }
}

#Preview {
    @Previewable @State var falseValue = false
    @Previewable @State var trueValue = true
    
    AsyncCallToActionButton(isLoading: $falseValue) {
        
    }
    .padding()
    AsyncCallToActionButton(isLoading: $falseValue, title: "Test") {
        
    }
    .padding()
    AsyncCallToActionButton(isLoading: $trueValue) {
        
    }
    .padding()
}
