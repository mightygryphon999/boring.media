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
    var hotKey: HotKey?

    func applicationDidFinishLaunching(_ notification: Notification) {
        panel = FloatingPanel(
            contentRect: NSRect(x: 0, y: 0, width: 600, height: 80)
        )

        panel.contentView = NSHostingView(rootView: ContentView())
        panel.center()
        panel.orderOut(nil)

        setupHotkey()
    }
}
