//
//  ParticalVisualizer.swift
//  SampleiOS15_1_202106
//
//  Created by 61-201507-2184 on 2021/06/16.
//

import SwiftUI

struct ParticalVisualizer: View {
    var gradien: [Gradient] = []
    
    @State private var count = 2
    var body: some View {
        TimelineView(.animation) {timeline in
            Canvas { context, size in
                let now = timeline.date.timeIntervalSinceReferenceDate
                let angle = Angle.degrees(now.remainder(dividingBy: 3) * 120)
                let x = cos(angle.radians)
                var image = context.resolve(Image(systemName: "sparkle"))
                image.shading = .color(.blue)
                
                context.blendMode = .screen
                let imageSize = image.size
                for i in 0..<count {
                    let frame = CGRect(
                        x: 0.5 * size.width + Double(i) * imageSize.width * x,
                        y: 0.5 * size.height,
                        width: imageSize.width,
                        height: imageSize.height
                    
                    )
                    var innerContext = context
                    innerContext.opacity = 0.5
                    innerContext.fill(Ellipse().path(in: frame), with: .color(.cyan))
                    context.draw(image, in: frame)
                }
            }
        }
        .onTapGesture {
            count += 1
        }
        .accessibilityLabel("A partical visualizer")
    }
}

struct ParticalVisualizer_Previews: PreviewProvider {
    static var previews: some View {
        ParticalVisualizer()
            .preferredColorScheme(.dark)
    }
}
