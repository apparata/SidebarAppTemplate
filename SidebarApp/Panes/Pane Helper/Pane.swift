import SwiftUI

struct Pane<Content: View>: View {
    
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(PaneBackground())
    }
}

struct Pane_Previews: PreviewProvider {
    static var previews: some View {
        Pane {
            Text("Pane")
        }
    }
}
