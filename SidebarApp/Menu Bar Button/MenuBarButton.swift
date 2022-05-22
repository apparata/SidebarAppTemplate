import AppKit
import SwiftUI

class MenuBarButton {
    
    let statusItem: NSStatusItem
    
    init() {
        statusItem = NSStatusBar.system
            .statusItem(withLength: CGFloat(NSStatusItem.squareLength))
                
        guard let button = statusItem.button else {
            return
        }
        
        button.image = NSImage(systemSymbolName: "hammer", accessibilityDescription: nil)
        button.imagePosition = NSControl.ImagePosition.imageOnly
        button.target = self
        button.action = #selector(showMenu(_:))
        button.sendAction(on: [.leftMouseUp, .rightMouseUp])
    }
    
    // MARK: - Show Menu
    
    @objc
    func showMenu(_ sender: AnyObject?) {
        switch NSApp.currentEvent?.type {
        case .leftMouseUp:
            showPrimaryMenu()
        case .rightMouseUp:
            showSecondaryMenu()
        default:
            break
        }
    }
    
    func showPrimaryMenu() {
        let hostingView = NSHostingView(rootView: MenuBarPopup())
        hostingView.frame.size = hostingView.fittingSize
        
        let menu = NSMenu()
        let item = NSMenuItem()
        item.view = hostingView
        menu.addItem(item)
        showStatusItemMenu(menu)
    }
        
    func showSecondaryMenu() {
        let menu = NSMenu()
        addItem("About...", action: #selector(showAbout), key: "c", to: menu)
        addItem("Do Stuff", action: #selector(doStuff), key: "d", to: menu)
        menu.addItem(NSMenuItem.separator())
        addItem("Quit", action: #selector(quit), key: "q", to: menu)
        showStatusItemMenu(menu)
    }
    
    private func showStatusItemMenu(_ menu: NSMenu) {
        statusItem.menu = menu
        statusItem.button?.performClick(nil)
        statusItem.menu = nil
    }
    
    private func addItem(_ title: String, action: Selector?, key: String, to menu: NSMenu) {
        let item = NSMenuItem()
        item.title = title
        item.target = self
        item.action = action
        item.keyEquivalent = key
        menu.addItem(item)
    }
    
    // MARK: - Actions
    
    @objc
    func showAbout() {
        AboutWindow.show()
    }
    
    @objc
    func quit() {
        NSApp.terminate(self)
    }

    @objc
    func doStuff() {
        print("Do stuff")
    }
}

