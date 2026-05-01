//
//  ImageService.swift
//  boring.media
//
//  Created by Griffin Roberts on 4/28/26.
//

import Foundation
import AVFoundation
import ImageIO
import UniformTypeIdentifiers

func video_convert_service(videoURL: URL, withPreset preset: String = AVAssetExportPresetHighestQuality, toFileType outputFileType: AVFileType, atURL outputURL: URL) async throws {
    let video = AVURLAsset(url: videoURL)
    
    guard await AVAssetExportSession.compatibility(ofExportPreset: preset,
                                                   with: video,
                                                   outputFileType: outputFileType) else {
        print("The preset can't export the video to the output file type.")
        return
    }
    
    // Create and configure the export session.
    guard let exportSession = AVAssetExportSession(asset: video,
                                                   presetName: preset) else {
        print("Failed to create export session.")
        return
    }
    exportSession.outputFileType = outputFileType
    exportSession.outputURL = outputURL
    
    // Convert the video to the output file type and export it to the output URL.
    try await exportSession.export(to: outputURL, as: outputFileType)
}
