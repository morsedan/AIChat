//
//  AppState.swift
//  AIChat
//
//  Created by Morse on 1/11/25.
//

import SwiftUI

@Observable
class AppState {
    
    private(set) var showMainView: Bool {
        didSet {
            UserDefaults.showMainView = showMainView
        }
    }
    
    init(showTabBar: Bool = UserDefaults.showMainView) {
        self.showMainView = showTabBar
    }
    
    func updateViewState(showMainView: Bool) {
        self.showMainView = showMainView
    }
}
