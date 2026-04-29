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
                }
                .padding(5)
                .glassEffect(.clear.tint(Color("buttonsForeground")))
                Button("Convert") {
                    
                }
            }
        }
    }
}

#Preview {
    ConversionSettingsView()
}
