//
//  saveData.swift
//  boring.media
//
//  Created by Griffin Roberts on 5/4/26.
//

import SwiftData
import Foundation
import AVFoundation
internal import Combine
import UniformTypeIdentifiers

@Model
class SaveData {
    var droppedURLs: [URL] = []
    var outputURL: URL?
    var selectedConvertImage: String
    var maxamized: Bool = false

    init(
        droppedURLs: [URL] = [],
        outputURL: URL? = nil,
        selectedConvertImage: UTType = .png,
        maxamized: Bool = false
    ) {
        self.droppedURLs = droppedURLs
        self.outputURL = outputURL
        self.selectedConvertImage = selectedConvertImage.identifier
        self.maxamized = maxamized
    }
}
