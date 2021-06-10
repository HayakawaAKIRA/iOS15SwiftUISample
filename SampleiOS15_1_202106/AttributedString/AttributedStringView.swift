//
//  AttributedStringView.swift
//  SampleiOS15_1_202106
//
//  Created by 61-201507-2184 on 2021/06/09.
//

import SwiftUI

struct AttributedStringView: View {
    var body: some View {
        LazyVStack {
            Text("MarkDown").font(.title).bold()
            VStack {
                Text("Regular")
                Text("*Italics*")
                Text("**Bold**")
                Text("~Strikethrough~")
                Text("`Code`")
                Text("[Link](https://apple.com)")
                Text("***[They](https://apple.com) ~are~ `combinable`***")
            }
            VStack {
                Text("They *work on **multiple** lines! Very cool.* Lorem ipsum dolor sit amet, ~consectetur adipiscing elit, sed do eiusmod tempor incididunt.~")
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(16)
                    .padding()
            }
            
            
            Text("Normals").font(.title).bold()
            VStack {
                Text("Regular")
                Text("Italics") { $0.font = Font.system(size: 17).italic() }
                Text("Bold") { $0.font = Font.system(size: 17).bold() }
                Text("Strikethrough") { $0.strikethroughColor = Color.red }
                Text("Code") { $0.font = Font.system(size: 17, design: .monospaced) }
                Text("Foreground Color") { $0.foregroundColor = Color.purple }
                Text("Background Color") { $0.backgroundColor = Color.yellow }
                Text("Underline") { $0.underlineColor = Color.green }
            }
            VStack {
                Text("Kern") { $0.kern = CGFloat(10) }
                Text("Tracking") { $0.tracking = CGFloat(10) }
            }
            
            VStack {
                Text("Baseline Offset") { $0.baselineOffset = CGFloat(10) }
                Text("Link") { $0.link = URL(string: "https://apple.com") }
            }
        }
    }
}

struct AttributedStringView_Previews: PreviewProvider {
    static var previews: some View {
        AttributedStringView()
    }
}

fileprivate extension Text {
    init(_ string: String, configure: (inout AttributedString) -> Void) {
        var attributedString = AttributedString(string)
        configure(&attributedString)
        self.init(attributedString)
    }
}
