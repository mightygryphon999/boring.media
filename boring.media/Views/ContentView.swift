//
//  ContentView.swift
//  boring.media
//
//  Created by Griffin Roberts on 4/28/26.
//

import SwiftUI
import SwiftData
import UniformTypeIdentifiers

struct ContentView: View {    
    @EnvironmentObject var appState: AppState
    
    @Query private var saveData: [SaveData]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack {
            //FilePickerView()
                //.environmentObject(appState)
            ConversionSettingsView()
                .environmentObject(appState)
            
            if (appState.maxamized){
                FileListView()
                    .environmentObject(appState)
            }
        }
        .padding()
        .onAppear {
            let data = getSaveData()
            appState.maxamized = data.maxamized
            appState.outputURL = data.outputURL
            appState.droppedURLs = data.droppedURLs
        }
        .onChange(of: appState.maxamized) { oldValue, newValue in
            let data = getSaveData()
            data.maxamized = newValue
            try? context.save()
        }

        .onChange(of: appState.outputURL) { oldValue, newValue in
            let data = getSaveData()
            data.outputURL = newValue
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
    func saveOutputURL(_ url: URL) {
        let data = getSaveData()
        data.outputURL = url
        try? context.save()
    }
}

#Preview {
    ContentView()
}
