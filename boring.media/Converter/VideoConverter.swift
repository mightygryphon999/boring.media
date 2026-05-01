//
//  ImageConverter.swift
//  boring.media
//
//  Created by Griffin Roberts on 4/28/26.
//

import Foundation

func video_convert(appState: AppState) async {
    guard let input = appState.droppedURLs.first else {
        print("No input file")
        return
    }
    
    guard let output = appState.outputURL else {
        print("No input file")
        return
    }
    
    do{
        try await video_convert_service(videoURL: input, toFileType: appState.selectedConvertVideo, atURL: output)
    } catch {
        print("Failed Converion: \(error)")
    }
}
