import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationView {
            Sidebar()
            EmptyPane()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
