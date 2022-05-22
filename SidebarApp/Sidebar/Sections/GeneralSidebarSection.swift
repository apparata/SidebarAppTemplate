import SwiftUI

struct GeneralSidebarSection: View {
    
    @Binding var selection: SidebarPane?
    
    var body: some View {
        
        Section(header: Text("General")) {
            
            NavigationLink(
                destination: HelloWorldPane(),
                tag: .helloWorld,
                selection: $selection) {
                Label("Hello, World!", systemImage: "text.bubble")
            }
            
            NavigationLink(
                destination: WhatsUpPane(),
                tag: .whatsUp,
                selection: $selection) {
                Label("What's Up?", systemImage: "questionmark.app.dashed")
            }
        }
    }
}

struct GeneralSidebarSection_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSidebarSection(selection: .constant(.helloWorld))
    }
}
