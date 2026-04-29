//
//  ImageService.swift
//  boring.media
//
//  Created by Griffin Roberts on 4/28/26.
//

import Foundation
import ImageIO
import UniformTypeIdentifiers

func convert(inputURL: URL, outputURL: URL, outputType: UTType) throws {
    guard let image_source = CGImageSourceCreateWithURL(inputURL as CFURL, nil) else { throw NSError(domain: "Decode Error", code: 1) }
    let cgImage = CGImageSourceCreateImageAtIndex(image_source, 0, nil)
    
    guard let destination = CGImageDestinationCreateWithURL(outputURL as CFURL, outputType.identifier as CFString, 1, nil)
            else { throw NSError(domain: "Encode Error", code: 2) }
    
    CGImageDestinationAddImage(destination, cgImage!, nil)
    guard CGImageDestinationFinalize(destination) else{
        throw NSError(domain: "Finalize Error", code: 3)
    }
}
