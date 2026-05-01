//
//  AppState.swift
//  boring.media
//
//  Created by Griffin Roberts on 4/28/26.
//

import Foundation
internal import Combine
import UniformTypeIdentifiers

class AppState : ObservableObject {
    @Published var droppedURLs: [URL] = []
    @Published var outputURL: URL?
    
    @Published var selectedConvertImage: UTType = .png
}
