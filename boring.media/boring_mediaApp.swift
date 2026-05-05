//
//  boring_mediaApp.swift
//  boring.media
//
//  Created by Griffin Roberts on 4/28/26.
//

import SwiftUI
import SwiftData

@main
struct boring_mediaApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject var appState = AppState()
    
    init() {
        appDelegate.appState = appState
    }

    var body: some Scene {
        Settings { EmptyView() }
    }
}
