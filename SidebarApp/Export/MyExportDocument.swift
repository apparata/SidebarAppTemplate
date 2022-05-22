import SwiftUI
import UniformTypeIdentifiers

struct MyDataEntry {
    let name: String
    let number: Int
}

struct MyExportDocument: FileDocument {
    
    static var readableContentTypes = [UTType.tabSeparatedText]

    let entries: [MyDataEntry]

    init(entries: [MyDataEntry]) {
        self.entries = entries
    }

    init(configuration: ReadConfiguration) throws {
        self.init(entries: [])
        // TODO: Implement import
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        
        var data = Data()
        
        data.append("Name")
        data.append(delimiter)
        data.append("Number")
        data.append(delimiter)
        
        for entry in entries {
            data.append(entry.name)
            data.append(delimiter)
            data.append(entry.number)
            data.append(newline)
        }
        
        return FileWrapper(regularFileWithContents: data)
    }
}

private let newline = "\n".data(using: .utf8)!
private let delimiter = "\t".data(using: .utf8)!

private extension Data {
    
    mutating func append<S: StringProtocol>(_ string: S) {
        guard let data = string.data(using: .utf8) else {
            return
        }
        append(data)
    }

    mutating func append(_ number: Int) {
        append("\(number)")
    }
}
