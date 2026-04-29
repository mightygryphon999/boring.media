//
//  ContentView.swift
//  boring.media
//
//  Created by Griffin Roberts on 4/28/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appState = AppState()
    
    var body: some View {
        VStack {
            //FilePickerView()
                //.environmentObject(appState)
            FileListView()
                .environmentObject(appState)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
