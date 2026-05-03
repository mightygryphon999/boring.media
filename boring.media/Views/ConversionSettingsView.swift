//
//  ConversionSettingsView.swift
//  boring.media
//
//  Created by Griffin Roberts on 4/29/26.
//

import SwiftUI
import UniformTypeIdentifiers
import AVFoundation

struct ConversionSettingsView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        TabView {
            HStack{
                Picker(selection: $appState.selectedConvertImage, label: Text("To: ")) {
                    Text("PNG").tag(UTType.png)
                    Text("JPG").tag(UTType.jpeg)
                    Text("GIF").tag(UTType.gif)
                    Text("PDF").tag(UTType.pdf)
                    Text("RAW").tag(UTType.rawImage)
                    Text("HEIF").tag(UTType.heif)
                    Text("TIFF").tag(UTType.tiff)
                }
                .padding(10)
                .glassEffect(.clear.tint(Color("buttonsForeground")))
                Text("Output: \(appState.outputURL?.absoluteString ?? "none")")
                    .frame(width: 250, height: 50)
                    .glassEffect(.regular.tint(Color("buttonsForeground")), in: .rect(cornerRadius: 10))
                    .dropDestination(for: URL.self){ items, location in appState.outputURL = items.first
                        return true
                    }
                Button("Convert") {
                    image_convert(appState: appState)
                }
                .buttonStyle(.glassProminent)
            }
            .tabItem{
                Text("Image")
            }
            .frame(height: 50)
            HStack{
                Picker(selection: $appState.selectedConvertVideo, label: Text("To: ")) {
                    Text("MOV").tag(AVFileType.mov)
                    Text("MP4").tag(AVFileType.mp4)
                    Text("MP3").tag(AVFileType.mp3)
                    Text("AVCI").tag(AVFileType.avci)
                    Text("M4V").tag(AVFileType.m4v)
                }
                .padding(10)
                .glassEffect(.clear.tint(Color("buttonsForeground")))
                Text("Output: \(appState.outputURL?.absoluteString ?? "none")")
                    .frame(width: 250, height: 50)
                    .glassEffect(.regular.tint(Color("buttonsForeground")), in: .rect(cornerRadius: 10))
                    .dropDestination(for: URL.self){ items, location in appState.outputURL = items.first
                        return true
                    }
                Button("Convert") {
                    Task {
                        await video_convert(appState: appState)
                    }
                }
                .buttonStyle(.glassProminent)
            }
            .tabItem{
                Text("Video")
            }
            .frame(height: 50)
        }
    }
}

#Preview {
    ConversionSettingsView()
}
