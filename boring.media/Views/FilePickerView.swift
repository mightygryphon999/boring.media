//
//  FilePickerView.swift
//  boring.media
//
//  Created by Griffin Roberts on 4/28/26.
//

import SwiftUI

struct FilePickerView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        picker
    }
    var picker: some View {
        Text("Drop File Here")
            .frame(width: 300, height: 300)
            .glassEffect(.regular.tint(Color("foreground")), in: .rect(cornerRadius: 10))
            .dropDestination(for: URL.self){ items, location in appState.droppedURLs.append(contentsOf: items)
                return true
            }
    }
}

#Preview {
    FilePickerView()
}
