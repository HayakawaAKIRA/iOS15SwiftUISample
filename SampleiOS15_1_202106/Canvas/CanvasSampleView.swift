//
//  CanvasSampleView.swift
//  SampleiOS15_1_202106
//
//  Created by 61-201507-2184 on 2021/06/16.
//

import SwiftUI

enum CanvasSamples: String, Identifiable, View, CaseIterable {
    var id: String { rawValue }
    
    case particalVisual
    
    var body: some View {
        switch self {
        case .particalVisual:
            ParticalVisualizer()
        }
    }
}


struct CanvasSampleView: View {
    
    var samples: [CanvasSamples] = CanvasSamples.allCases
    
    var body: some View {
        List {
            ForEach(samples) { sample in
                NavigationLink(destination: sample) {
                    Text(sample.rawValue)
                        .id(UUID())
                }
            }
        }
    }
}

struct CanvasSampleView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasSampleView()
    }
}
