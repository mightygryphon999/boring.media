//
//  AppState.swift
//  boring.media
//
//  Created by Griffin Roberts on 4/28/26.
//

import Foundation
internal import Combine

class AppState : ObservableObject {
    @Published var droppedURLs: [URL] = []
}
