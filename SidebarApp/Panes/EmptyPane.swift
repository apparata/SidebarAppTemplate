import SwiftUI

struct EmptyPane: View {
    var body: some View {
        Pane {
            VStack {
                Text("No entry selected")
            }
        }
    }
}

struct EmptyPane_Previews: PreviewProvider {
    static var previews: some View {
        EmptyPane()
    }
}
