import SwiftUI

struct WhatsUpPane: View {
    
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    
    @State private var searchText = ""
    
    var body: some View {
        Pane {
            VStack(spacing: 10) {
                ForEach(searchResults, id: \.self) { name in
                    Text("What's up, \(name)?")
                }
            }
        }
        .searchable(
            text: $searchText,
            placement: .toolbar,
            prompt: "Search",
            suggestions: {
                ForEach(searchResults, id: \.self) { result in
                    Text(result)
                        .searchCompletion(result)
                }
            })
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button {
                    print("Action!")
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
            }
            ToolbarItem(placement: .automatic) {
                Button {
                    print("Action!")
                } label: {
                    Image(systemName: "trash")
                }
            }
            ToolbarItem(placement: .automatic) {
                Button {
                    print("Action!")
                } label: {
                    Image(systemName: "hammer")
                }
            }
        }
        .navigationSubtitle("What's Up?")
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}

struct WhatsUpPane_Previews: PreviewProvider {
    static var previews: some View {
        WhatsUpPane()
    }
}
