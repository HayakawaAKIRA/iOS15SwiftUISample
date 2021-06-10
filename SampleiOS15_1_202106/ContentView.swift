//
//  ContentView.swift
//  SampleiOS15_1_202106
//
//  Created by 61-201507-2184 on 2021/06/09.
//

import SwiftUI


enum Destinations: String, Identifiable, CaseIterable, View {
    var id: String {
        self.rawValue
    }
    
    case attributedString
    case timeLine
    case listAndSearch
    case asyncImage
    case material
    case sfsymbol
    
    var body: some View {
        Group {
            switch self {
            case .attributedString:
                AttributedStringView()
            case .timeLine:
                SampleTimelineView()
            case .listAndSearch:
                ListSearchSampleView()
            case .asyncImage:
                SampleAsyncImageView()
            case .material:
                MaterialSampleView()
            case .sfsymbol:
                SFSymbolSampleView()
            }
        }
        .onAppear {
            Self._printChanges()
        }
    }
}


struct ContentViewState {
    var destinations: [Destinations] = Destinations.allCases
}

class ContentViewModel: ObservableObject {
    @Published private(set) var state: ContentViewState = .init()
}

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel = .init()
    
    var body: some View {
        TabView {
            NavigationView {
                List {
                    ForEach(viewModel.state.destinations) {
                        destination in
                        NavigationLink(destination.rawValue, destination: {
                            destination
                        })
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Samples")
                .onAppear {
                    Self._printChanges()
                }
            }
            .tag(1)
            .tabItem{
                Text("Main")
                Image(systemName: "house")
            }
            .badge(1)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
