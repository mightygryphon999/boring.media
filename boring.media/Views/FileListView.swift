//
//  FileListView.swift
//  boring.media
//
//  Created by Griffin Roberts on 4/28/26.
//

import SwiftUI

struct FileListView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack{
            ForEach(appState.droppedURLs, id: \.self){
                url in Text(url.lastPathComponent)
            }
        }
    }
}

#Preview {
    FileListView()
}
