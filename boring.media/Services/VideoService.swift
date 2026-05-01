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

func video_convert_service(videoURL: URL, withPreset preset: String = AVAssetExportPresetPassthrough, toFileType outputFileType: AVFileType, atURL outputURL: URL) async throws {
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
    
    let folderOutput = outputURL
    
    let inputName = videoURL.deletingPathExtension().lastPathComponent
    let timestamp = Int(Date().timeIntervalSince1970)
    
    var finalURL = folderOutput
        .appendingPathComponent("\(inputName)_converted_\(timestamp)")
        .appendingPathExtension({
            switch outputFileType {
                case .mp4: return "mp4"
                case .mp3: return "mp3"
                case .mov: return "mov"
                case .m4v: return "m4v"
                case .avci: return "AVCI"
            default: return "mp4"
            }
        }())
    
    finalURL = FileManager.default.temporaryDirectory
    
    exportSession.outputFileType = outputFileType
    exportSession.outputURL = finalURL
    
    print(outputURL)
    print(finalURL)
    print(outputFileType)
    
    // Convert the video to the output file type and export it to the output URL.
    try await exportSession.export(to: outputURL, as: outputFileType)
}
