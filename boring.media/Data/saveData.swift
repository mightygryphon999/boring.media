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
    var droppedBookmarks: [Data] = []
    var outputBookmark: Data?
    
    var selectedConvertImage: String
    var maxamized: Bool = false
    var moreVisible: Bool = false

    init(
        droppedBookmarks: [Data] = [],
        outputBookmark: Data? = nil,
        selectedConvertImage: UTType = .png,
        maxamized: Bool = false,
        moreVisible: Bool = false
    ) {
        self.droppedBookmarks = droppedBookmarks
        self.outputBookmark = outputBookmark
        self.selectedConvertImage = selectedConvertImage.identifier
        self.maxamized = maxamized
        self.moreVisible = moreVisible
    }
}
