import SwiftUI

struct AttributionsView: View {
    var body: some View {
        ScrollView(.vertical) {
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Attributions")
                        .font(.title)
                        .bold()
                    Text("<Insert attributions here>")
                        .multilineTextAlignment(.leading)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

struct AttributionsView_Previews: PreviewProvider {
    static var previews: some View {
        AttributionsView()
    }
}
