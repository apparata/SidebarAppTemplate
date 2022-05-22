import SwiftUI

struct MyCommands: Commands {
    
    var body: some Commands {
        CommandMenu(Text("My Commands", comment: "My custom actions")) {
            Button {
                print("Build!")
            } label: {
                Text("Build", comment: "Build something or whatever.")
            }
            .keyboardShortcut("B", modifiers: [.command])
            
            Divider()
            
            Button {
                print("Do Stuff!")
            } label: {
                Text("Do Stuff", comment: "Do various types of stuff.")
            }
            .keyboardShortcut("D", modifiers: [.command])
        }
    }
}
