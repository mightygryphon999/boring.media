//
//  AppState.swift
//  boring.media
//
//  Created by Griffin Roberts on 4/28/26.
//

import Foundation
import AVFoundation
internal import Combine
import UniformTypeIdentifiers

class AppState : ObservableObject {
    @Published var droppedURLs: [URL] = []
    @Published var outputURL: URL?
    
    @Published var selectedConvertImage: UTType = .png
    @Published var selectedConvertVideo: AVFileType = .mov
    
    @Published var maxamized: Bool = false
}
