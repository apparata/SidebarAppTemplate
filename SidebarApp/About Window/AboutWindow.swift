import AppKit
import SwiftUI

class AboutWindow: NSWindowController {
    
    static func show() {
        AboutWindow().window?.makeKeyAndOrderFront(nil)
    }

    convenience init() {
        
        let window = Self.makeWindow()
                
        window.backgroundColor = NSColor.controlBackgroundColor
                
        self.init(window: window)

        let contentView = makeAboutView()
            
        window.titleVisibility = .hidden
        window.titlebarAppearsTransparent = true
        window.center()
        window.title = "About Bootstrapp"
        window.contentView = NSHostingView(rootView: contentView)
        window.alwaysOnTop = true
    }
    
    private static func makeWindow() -> NSWindow {
        let contentRect = NSRect(x: 0, y: 0, width: 500, height: 260)
        let styleMask: NSWindow.StyleMask = [
            .titled,
            .closable,
            .fullSizeContentView
        ]
        return NSWindow(contentRect: contentRect,
                        styleMask: styleMask,
                        backing: .buffered,
                        defer: false)
    }

    private func makeAboutView() -> some View {
        AboutView(
            icon: NSApp.applicationIconImage ?? NSImage(),
            name: Bundle.main.name,
            version: Bundle.main.version,
            build: Bundle.main.buildVersion,
            copyright: Bundle.main.copyright,
            developerName: "<Insert name here>")
            .frame(width: 500, height: 260)
    }
}
