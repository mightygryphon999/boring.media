import SwiftUI
import SwiftData
import UniformTypeIdentifiers

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    
    @Query private var saveData: [SaveData]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack {
            ConversionSettingsView()
                .environmentObject(appState)
            
            if (appState.maxamized){
                FileListView()
                    .environmentObject(appState)
                    .transition(
                            .asymmetric(
                                insertion: .move(edge: .bottom)
                                    .combined(with: .opacity)
                                    .combined(with: .scale(scale: 0.95)),
                                
                                removal: .move(edge: .top)
                                    .combined(with: .opacity)
                            )
                        )
            }
        }
        .padding()
        .onAppear {
            let data = getSaveData()
            appState.maxamized = data.maxamized
            
            if let bookmark = data.outputBookmark {
                var isStale = false
                do {
                    let url = try URL(
                        resolvingBookmarkData: bookmark,
                        options: .withSecurityScope,
                        relativeTo: nil,
                        bookmarkDataIsStale: &isStale
                    )
                    
                    url.startAccessingSecurityScopedResource()
                    appState.outputURL = url
                    
                } catch {
                    print("Failed to restore output bookmark:", error)
                }
            }
            
            // Restore dropped URLs
            appState.droppedURLs = data.droppedBookmarks.compactMap { bookmark in
                var isStale = false
                return try? URL(
                    resolvingBookmarkData: bookmark,
                    options: .withSecurityScope,
                    relativeTo: nil,
                    bookmarkDataIsStale: &isStale
                )
            }
        }
        
        .onChange(of: appState.maxamized) { _, newValue in
            let data = getSaveData()
            data.maxamized = newValue
            try? context.save()
        }

        .onChange(of: appState.outputURL) { _, newValue in
            guard let url = newValue else { return }
            let data = getSaveData()
            
            do {
                let bookmark = try url.bookmarkData(options: .withSecurityScope)
                data.outputBookmark = bookmark
                try context.save()
            } catch {
                print("Failed to save output bookmark:", error)
            }
        }
        .onChange(of: appState.moreVisible) { _, newValue in
            let data = getSaveData()
            data.moreVisible = newValue
            try? context.save()
        }
        .onChange(of: appState.droppedURLs) { _, newValue in
            let data = getSaveData()
            
            data.droppedBookmarks = newValue.compactMap { url in
                try? url.bookmarkData(options: .withSecurityScope)
            }
            
            try? context.save()
        }
    }
    
    func getSaveData() -> SaveData {
        if let existing = saveData.first {
            return existing
        } else {
            let new = SaveData()
            context.insert(new)
            return new
        }
    }
}
