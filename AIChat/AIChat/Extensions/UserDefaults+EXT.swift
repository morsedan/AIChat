//
//  UserDefaults+EXT.swift
//  AIChat
//
//  Created by Morse on 1/11/25.
//

import Foundation

extension UserDefaults {
    
    private enum Keys {
        static let showMainView = "showMainView"
    }
    
    static var showMainView: Bool {
        get {
            let show = UserDefaults.standard.bool(forKey: Keys.showMainView)
            print("get", show)
            return show
        }
        set {
            print("set", newValue)
            UserDefaults.standard.set(newValue, forKey: Keys.showMainView)
            let show = UserDefaults.standard.bool(forKey: Keys.showMainView)
            print("post set", show)
        }
    }
}
