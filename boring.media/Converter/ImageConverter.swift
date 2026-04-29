//
//  ImageConverter.swift
//  boring.media
//
//  Created by Griffin Roberts on 4/28/26.
//

import Foundation

struct ImageConverter{
    func image_convert(appState: AppState) {
        do{
            try image_convert_service(inputURL: appState.droppedURLs.first!, outputURL: appState.droppedURLs.first!, outputType: appState.selectedConvertImage.first!)
        } catch {
            print("Failed Converion")
        }
    }
}
