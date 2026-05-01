//
//  ConversionSettingsView.swift
//  boring.media
//
//  Created by Griffin Roberts on 4/29/26.
//

import SwiftUI
import UniformTypeIdentifiers

struct ConversionSettingsView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack{
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
                .padding(5)
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
        }
    }
}

#Preview {
    ConversionSettingsView()
}
