//
//  ImageConverter.swift
//  boring.media
//
//  Created by Griffin Roberts on 4/28/26.
//

import Foundation

func image_convert(appState: AppState) {
    guard let input = appState.droppedURLs.first else {
        print("No input file")
        return
    }
    
    guard let output = appState.outputURL else {
        print("No input file")
        return
    }
    
    do{
        try image_convert_service(inputURL: input, outputURL: output, outputType: appState.selectedConvertImage)
    } catch {
        print("Failed Converion: \(error)")
    }
}
