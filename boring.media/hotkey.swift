//
//  hotkey.swift
//  boring.media
//
//  Created by Griffin Roberts on 5/4/26.
//

import HotKey
import AppKit
import SwiftUI

extension AppDelegate {
    func setupHotkey() {
        hotKeySpace = HotKey(key: .space, modifiers: [.control])

        hotKeySpace?.keyDownHandler = { [weak self] in
            guard let self = self else { return }

            if self.panel.isVisible {
                self.panel.orderOut(nil)
            } else {
                self.panel.makeKeyAndOrderFront(nil)
                NSApp.activate(ignoringOtherApps: true)
            }
        }
        
        hotKeyL = HotKey(key: .l, modifiers: [.control])

        hotKeyL?.keyDownHandler = { [weak self] in
            guard let self = self else { return }

            self.appState.maxamized.toggle()
        }
    }
}
