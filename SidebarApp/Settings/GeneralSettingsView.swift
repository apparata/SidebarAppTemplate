import SwiftUI

struct GeneralSettingsTab: View {
    
    @AppStorage("settings.general.name") private var name: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Name:", text: $name, onCommit: {
                    print("On commit!")
                })
                Text("This should describe the text field.")
                    .font(.caption)
                Button("Apply", action: {
                    print("Apply!")
                })
            }
        }
        .padding(20)
    }}

struct GeneralSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingsTab()
    }
}
