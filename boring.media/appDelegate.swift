//
//  appDelegate.swift
//  boring.media
//
//  Created by Griffin Roberts on 5/4/26.
//

import AppKit
import SwiftUI
import HotKey

class AppDelegate: NSObject, NSApplicationDelegate {
    var panel: FloatingPanel!
    var hotKeySpace: HotKey?
    var hotKeyL: HotKey?
    
    var appState: AppState!

    func applicationDidFinishLaunching(_ notification: Notification) {
        panel = FloatingPanel(
            contentRect: NSRect(x: 0, y: 0, width: 650, height: 100)
        )

        panel.contentView = NSHostingView(rootView: ContentView().environmentObject(appState))
        panel.center()
        panel.orderOut(nil)

        setupHotkey()
    }
}
