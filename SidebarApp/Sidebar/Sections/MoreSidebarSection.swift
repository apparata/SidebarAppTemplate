import SwiftUI

struct MoreSidebarSection: View {
    
    @Binding var selection: SidebarPane?
    
    var body: some View {
                
        Section(header: Text("More")) {
            
            NavigationLink(
                destination: MoreStuffPane(),
                tag: .moreStuff,
                selection: $selection) {
                Label("More Stuff", systemImage: "ellipsis.circle")
            }
        }
    }
}

struct MoreSidebarSection_Previews: PreviewProvider {
    static var previews: some View {
        MoreSidebarSection(selection: .constant(.moreStuff))
    }
}
