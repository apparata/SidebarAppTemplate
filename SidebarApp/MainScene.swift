import SwiftUI

struct MainScene: Scene {
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .frame(minWidth: 400, minHeight: 300)
                .background(AlwaysOnTop())
        }
        .commands {
            AboutCommand()
            SidebarCommands()
            ExportCommands()
            AlwaysOnTopCommand()
            
            /// Add a menu with custom commands
            MyCommands()
            
            // Remove the "New Window" option from the File menu.
            CommandGroup(replacing: .newItem, addition: { })
        }
        Settings {
            SettingsWindow()
        }
    }
}
