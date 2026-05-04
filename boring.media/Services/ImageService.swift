//
//  ImageService.swift
//  boring.media
//
//  Created by Griffin Roberts on 4/28/26.
//

import Foundation
import ImageIO
import UniformTypeIdentifiers

func image_convert_service(inputURL: URL, outputURL: URL, outputType: UTType) throws {
    guard let image_source = CGImageSourceCreateWithURL(inputURL as CFURL, nil) else { throw NSError(domain: "Decode Error", code: 1) }
    
    let options: [CFString: Any] = [
        kCGImageSourceCreateThumbnailWithTransform: true,
        kCGImageSourceCreateThumbnailFromImageAlways: true,
        kCGImageSourceThumbnailMaxPixelSize: 3840,
        kCGImageDestinationLossyCompressionQuality: 1.0
    ]
    
    let cgImage = CGImageSourceCreateThumbnailAtIndex(image_source, 0, options as CFDictionary)
    
    let folderURL = outputURL
    let inputName = inputURL.deletingPathExtension().lastPathComponent
    let ext = outputType.preferredFilenameExtension ?? " png"
    
    let outputFileURL = folderURL.appendingPathComponent("\(inputName)_converted").appendingPathExtension(ext)
    
    guard let destination = CGImageDestinationCreateWithURL(outputFileURL as CFURL, outputType.identifier as CFString, 1, nil)
            else { throw NSError(domain: "Encode Error", code: 2) }
    
    CGImageDestinationAddImage(destination, cgImage!, nil)
    guard CGImageDestinationFinalize(destination) else{
        throw NSError(domain: "Finalize Error", code: 3)
    }
}
