import SwiftUI

struct SidebarFooter: View {
    var body: some View {
        VStack(spacing: 6) {
            Text("Sidebar Footer")
                .fontWeight(.medium)
                .foregroundColor(Color.white.opacity(0.6))
            Text("You could put stuff here.")
                .font(.footnote)
                .foregroundColor(Color.black.opacity(0.4))
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
        .padding()
    }
}

struct SidebarFooter_Previews: PreviewProvider {
    static var previews: some View {
        SidebarFooter()
    }
}
