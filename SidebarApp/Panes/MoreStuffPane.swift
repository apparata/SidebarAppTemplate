import SwiftUI
import UniformTypeIdentifiers

private let dropTypes = [UTType.fileURL]

// MARK: - More Stuff Pane

struct MoreStuffPane: View {
    var body: some View {
        Pane {
            DropTarget(delegate: self, types: dropTypes)
                .frame(width: 220, height: 140)
                .overlay(Text("Drop files here"))
        }
    }
}

// MARK: - Drop Delegate

extension MoreStuffPane: DropDelegate {
    
    /// Called when a drop, which has items conforming to any of the types
    /// passed to the onDrop() modifier, enters an onDrop target.
    /// This function is optional.
    func validateDrop(info: DropInfo) -> Bool {
        return true
    }

    /// Tells the delegate it can request the item provider data from the
    /// DropInfo incorporating it into the application's data model as
    /// appropriate. This function is required.
    ///
    /// Return `true` if the drop was successful, `false` otherwise.
    func performDrop(info: DropInfo) -> Bool {
        
        let itemProviders = info.itemProviders(for: [UTType.fileURL])

        guard itemProviders.count == 1 else {
            // We want exactly one template root folder to be dropped.
            return false
        }
        
        for itemProvider in itemProviders {
                        
            itemProvider.loadItem(forTypeIdentifier: UTType.fileURL.identifier, options: nil) { item, error in
                            
                guard let data = item as? Data else {
                    dump(error)
                    return
                }
                
                guard let url = URL(dataRepresentation: data, relativeTo: nil) else {
                    print("Error: Not a valid URL.")
                    return
                }
                
                print("File was dropped: \(url.path)")
            }
        }
        
        return true
    }

    /// Tells the delegate a validated drop has entered the modified view.
    /// This function is optional.
    func dropEntered(info: DropInfo) {
        print("Drop entered!")
    }

    /// Called as a validated drop moves inside the onDrop modified view.
    ///
    /// Return a drop proposal that contains the operation the delegate intends
    /// to perform at the DropInfo.location, The default implementation returns
    /// nil, which tells the drop to use that last valid returned value or else
    /// .copy.
    ///
    /// This function is optional.
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return nil
    }

    /// Tells the delegate a validated drop operation has exited the onDrop
    /// modified view. The default behavior does nothing.
    /// This function is optional.
    func dropExited(info: DropInfo) {
        print("Drop exited!")
    }
}

// MARK: - Preview

struct MoreStuffPane_Previews: PreviewProvider {
    static var previews: some View {
        MoreStuffPane()
    }
}
