//
//  hotkey.swift
//  boring.media
//
//  Created by Griffin Roberts on 5/4/26.
//

import HotKey
import AppKit

extension AppDelegate {
    func setupHotkey() {
        hotKey = HotKey(key: .space, modifiers: [.control])

        hotKey?.keyDownHandler = { [weak self] in
            guard let self = self else { return }

            if self.panel.isVisible {
                self.panel.orderOut(nil)
            } else {
                self.panel.makeKeyAndOrderFront(nil)
                NSApp.activate(ignoringOtherApps: true)
            }
        }
    }
}
