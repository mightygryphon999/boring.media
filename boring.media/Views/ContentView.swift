//
//  ContentView.swift
//  boring.media
//
//  Created by Griffin Roberts on 4/28/26.
//

import SwiftUI

struct ContentView: View {    
    @EnvironmentObject var appState: AppState
    
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
    }
}

#Preview {
    ContentView()
}
