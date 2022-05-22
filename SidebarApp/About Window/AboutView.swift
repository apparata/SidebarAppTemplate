import SwiftUI

struct AboutView: View {
    
    let icon: NSImage
    let name: String
    let version: String
    let build: String
    let copyright: String
    let developerName: String
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(nsImage: icon)
                    .padding()
                VStack(alignment: .leading) {
                    HStack(alignment: .firstTextBaseline) {
                        Text(name)
                            .font(.title)
                            .bold()
                        Spacer()
                        Text("Version \(version)") + Text(" (\(build))")
                    }
                    Divider()
                        .padding(.top, -8)
                    Text("Developed by")
                        .bold()
                        .padding(.bottom, 2)
                    Text(developerName)
                        .padding(.bottom, 12)
                    Spacer()
                    Text(copyright)
                        .font(.system(size: 10))
                        .foregroundColor(.secondary)
                }.padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 30))
            }
            HStack {
                Spacer()
                Button {
                    AttributionsWindow.show()
                } label: {
                    Text("Attributions")
                }
            }.padding()
                .background(Color(.sRGB, white: 0.0, opacity: 0.05))
        }
    }
}
