import Foundation

enum SidebarPane {
    
    // MARK: General Section

    case helloWorld
    case whatsUp
    
    // MARK: More Section
    
    case moreStuff
}

// MARK: - Protocol Conformances

extension SidebarPane: Equatable, Identifiable {
    var id: Self { self }
}
