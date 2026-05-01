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
        GlassEffectContainer{
            ScrollView{
                LazyVStack(spacing: 8){
                    ForEach(Array(appState.droppedURLs.enumerated()), id: \.offset){_,
                        url in Text(url.lastPathComponent)
                            .font(.headline)
                            .padding(25)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(.white.opacity(0.5), lineWidth: 0.5))
                            .glassEffect(.clear.tint(Color("buttonsForeground")), in: .rect(cornerRadius: 5))
                    }
                }
            }
            .padding()
            .scrollIndicators(.automatic)
        }
        .mask(LinearGradient(stops: [
                    .init(color: .clear, location: 0),
                    .init(color: .black, location: 0.05),
                    .init(color: .black, location: 0.95),
                    .init(color: .clear, location: 1)
                ],
                startPoint: .top,
                endPoint: .bottom))
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(.white.opacity(0.5), lineWidth: 0.5))
        .glassEffect(.clear.tint(Color("foreground")), in: .rect(topLeadingCorner: 16, topTrailingCorner: 16, bottomLeadingCorner: 16, bottomTrailingCorner: 16))
        .padding()
        .dropDestination(for: URL.self){ items, location in appState.droppedURLs.append(contentsOf: items)
            if (items.count == 1 && appState.outputURL != nil){
                image_convert(appState: appState)
            }
            return true
        }
    }
}

#Preview {
    FileListView()
}
