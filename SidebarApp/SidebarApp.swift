import SwiftUI

@main
struct SidebarApp: App {
    
    /// Legacy app delegate.
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        MainScene()
    }
}

// MARK: - App Delegate

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var menuBarButton: MenuBarButton?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        menuBarButton = MenuBarButton()
    }
        
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
