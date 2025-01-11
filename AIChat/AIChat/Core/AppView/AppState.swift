@Observable
class AppState {
    
    private(set) var showTabBar: Bool {
        didSet {
            UserDefaults.showTabBarView = showTabBar
        }
    }
    
    init(showTabBar: Bool = UserDefaults.showTabBarView) {
        self.showTabBar = showTabBar
    }
    
    func updateViewState(showTabBarView: Bool) {
        showTabBar = showTabBarView
    }
}

extension UserDefaults {
    
    private enum Keys {
        static let showTabBarView = "showTabBarView"
    }
    
    static var showTabBarView: Bool {
        get { UserDefaults.standard.bool(forKey: Keys.showTabBarView) }
        set { UserDefaults.standard.set(newValue, forKey: Keys.showTabBarView) }
    }
}