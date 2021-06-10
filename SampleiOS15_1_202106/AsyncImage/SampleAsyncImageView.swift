//
//  SampleAsyncImageView.swift
//  SampleiOS15_1_202106
//
//  Created by 61-201507-2184 on 2021/06/10.
//

import SwiftUI

struct SampleAsyncImageViewState {
    struct Photo: Identifiable, Codable {
        var albumId: Int
        var id: Int
        var title: String
        var url: String
        var thumbnailUrl: String
    }
    
    var photos: [Photo] = []
}


enum SampleAsyncImageViewAction {
    case loadPhotos
}

class SampleAsyncImageViewModel: ObservableObject {
    @Published private(set) var state: SampleAsyncImageViewState = .init()
    
    func send(_ action: SampleAsyncImageViewAction)  {
        switch action {
        case .loadPhotos:
            self.state.photos = []
            async {
                do {
                    let photosURL = URL(string: "https://jsonplaceholder.typicode.com/photos")!
                    let (data, _) = try await URLSession.shared.data(from: photosURL)
                    let photos = try JSONDecoder().decode([SampleAsyncImageViewState.Photo].self, from: data)
                    self.state.photos = photos
                }catch{
                    print(error.localizedDescription)
                }
            }
            break
        }
    }
}


struct SampleAsyncImageView: View {
    @StateObject var viewModel: SampleAsyncImageViewModel = .init()
    @State private var isRefresh: Bool = false
    
    var body: some View {
        List {
            ForEach(viewModel.state.photos) { photo in
                NavigationLink {
                    SampleAsyncImageDetailView(photo: photo)
                } label: {
                    HStack {
                        AsyncImage(url: URL(string: photo.thumbnailUrl), scale: 1.0) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                            }else if phase.error != nil {
                                Image(systemName: "exclamationmark.triangle")
                                    .frame(width: 100, height: 100)
                            }else{
                                Image(systemName: "photo")
                                    .frame(width: 100, height: 100)
                            }
                        }
                        Text(photo.title)
                        Spacer()
                    }
                }
            }
        }
        .task(id: isRefresh) {
            viewModel.send(.loadPhotos)
        }
        .navigationTitle("AsyncImage")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isRefresh.toggle()
                } label: {
                    Image(systemName: "arrow.clockwise.circle")
                }
            }
        }
    }
}

struct SampleAsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SampleAsyncImageView()
        }
    }
}


struct SampleAsyncImageDetailView: View {
    var photo: SampleAsyncImageViewState.Photo
    
    @State private var lastImageScale: CGFloat = 1.0
    @State private var imageScale: CGFloat = 1.0
    
    @State private var currentOffset = CGPoint.zero
    @State private var lastOffset = CGPoint.zero
    
    var magnificationGesture: some Gesture {
        MagnificationGesture()
            .onChanged {value in
                let delta = value / self.lastImageScale
                self.lastImageScale = value
                imageScale = self.imageScale * delta
            }
            .onEnded {value in
                lastImageScale = 1.0
                if imageScale < 1.0 {
                    withAnimation {
                        imageScale = 1.0
                    }
                }
            }
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            AsyncImage(url: URL(string: photo.url), scale: 1.0) { phase in
                if let image = phase.image {
                    GeometryReader {proxy in
                        ScrollView([.horizontal, .vertical]) {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: proxy.frame(in: .global).width*imageScale)
                                .gesture(
                                    magnificationGesture
                                )
                        }
                        .ignoresSafeArea(.all)
                    }
                }else if phase.error != nil {
                    Image(systemName: "exclamationmark.triangle")
                        .frame(width: 200, height: 200)
                }else{
                    Image(systemName: "photo")
                        .frame(width: 200, height: 200)
                }
            }
            VStack {
                Spacer()
                Text(photo.title)
            }
            .padding()
        }
    }
}
