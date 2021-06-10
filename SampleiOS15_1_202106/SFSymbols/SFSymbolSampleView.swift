//
//  SFSymbolSampleView.swift
//  SampleiOS15_1_202106
//
//  Created by 61-201507-2184 on 2021/06/10.
//

import SwiftUI

struct SFSymbolSampleView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                Group {
                    HStack(spacing: 20) {
                        Image(systemName: "person")
                        Image(systemName: "folder")
                        Image(systemName: "gearshape")
                        Image(systemName: "list.bullet")
                    }
                    
                    HStack(spacing: 20) {
                        Image(systemName: "person")
                        Image(systemName: "folder")
                        Image(systemName: "gearshape")
                        Image(systemName: "list.bullet")
                    }
                    .symbolVariant(.fill)
                    
                    HStack(spacing: 20) {
                        Label("Airplane", systemImage: "airplane.circle.fill")

                        Label("Airplane", systemImage: "airplane")
                            .symbolVariant(.circle)
                            .symbolVariant(.fill)

                        Label("Airplane", systemImage: "airplane")
                            .symbolVariant(.circle.fill)
                    }
                    
                    HStack(spacing: 20) {
                        Image(systemName: "arrow.left")
                            .symbolVariant(.square) // This shape takes precedence.
                            .symbolVariant(.circle)
                            .symbolVariant(.fill)
                    }
                }
                
                Group {
                    HStack(spacing: 10) {
                        Image(systemName: "heart")
                            .symbolVariant(.slash)
                        Image(systemName: "heart")
                            .symbolVariant(.circle)
                        Image(systemName: "heart")
                            .symbolVariant(.square)
                        Image(systemName: "heart")
                            .symbolVariant(.rectangle)
                        Image(systemName: "heart")
                            .symbolVariant(.fill)
                        Image(systemName: "heart")
                            .symbolVariant(.slash.fill)
                        Image(systemName: "heart")
                            .symbolVariant(.circle.fill)
                        Image(systemName: "heart")
                            .symbolVariant(.square.fill)
                        Image(systemName: "heart")
                            .symbolVariant(.rectangle.fill)
                    }
                }
                
                Group {
                    HStack(spacing: 10) {
                        Image(systemName: "character.book.closed")
                        Image(systemName: "heart.fill")
                        Image(systemName: "crown")
                        Image(systemName: "square.stack.3d.up.fill")
                        Image(systemName: "square.2.stack.3d.bottom.fill")
                        Image(systemName: "arrow.uturn.left.circle.fill")
                    }
                    HStack(spacing: 10) {
                        Image(systemName: "character.book.closed")
                        Image(systemName: "heart.fill")
                        Image(systemName: "crown")
                        Image(systemName: "square.stack.3d.up.fill")
                        Image(systemName: "square.2.stack.3d.bottom.fill")
                        Image(systemName: "arrow.uturn.left.circle.fill")
                    }
                    .symbolRenderingMode(.multicolor)
                    HStack(spacing: 10) {
                        Image(systemName: "character.book.closed")
                        Image(systemName: "heart.fill")
                        Image(systemName: "crown")
                        Image(systemName: "square.stack.3d.up.fill")
                        Image(systemName: "square.2.stack.3d.bottom.fill")
                        Image(systemName: "arrow.uturn.left.circle.fill")
                    }
                    .symbolRenderingMode(.hierarchical)
                    HStack(spacing: 10) {
                        Image(systemName: "character.book.closed")
                        Image(systemName: "heart.fill")
                        Image(systemName: "crown")
                        Image(systemName: "square.stack.3d.up.fill")
                        Image(systemName: "square.2.stack.3d.bottom.fill")
                        Image(systemName: "arrow.uturn.left.circle.fill")
                    }
                    .foregroundStyle(.red, .yellow)
                }
            }
        }
    }
}

struct SFSymbolSampleView_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolSampleView()
    }
}
