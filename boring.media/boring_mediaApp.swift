//
//  boring_mediaApp.swift
//  boring.media
//
//  Created by Griffin Roberts on 4/28/26.
//

import SwiftUI

@main
struct boring_mediaApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings { EmptyView() }
    }
}
