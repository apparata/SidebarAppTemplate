import SwiftUI

/// In a finished app, this would be in a model object somewhere.
private let myExportDocument = MyExportDocument(entries: [
    MyDataEntry(name: "Wayne Gretzky", number: 99),
    MyDataEntry(name: "Mario Lemieux", number: 66),
    MyDataEntry(name: "Peter Forsberg", number: 21),
    MyDataEntry(name: "Mats Sundin", number: 13)
])

struct ExportCommands: Commands {
    
    @State private var isShowingExportDialog = false

    var body: some Commands {
        CommandGroup(replacing: .importExport) {
            Section {
                Button("Export…") {
                    isShowingExportDialog = true
                }
                .fileExporter(
                    isPresented: $isShowingExportDialog,
                    document: myExportDocument,
                    contentType: .tabSeparatedText,
                    defaultFilename: "MyDocument.tsv") { result in
                }
            }
        }
    }
}
