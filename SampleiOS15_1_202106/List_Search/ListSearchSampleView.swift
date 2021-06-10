//
//  ListSearchSampleView.swift
//  SampleiOS15_1_202106
//
//  Created by 61-201507-2184 on 2021/06/09.
//

import SwiftUI

struct ListSearchSampleViewState {
    var searchText: String = ""
    
    var rowDatas: [String] = RandomData.randamDatas
    
    var suggestions: [String] = []
}

enum ListSearchSampleViewAction {
    case search(newText: String)
    case swipeAction1
    case swipeAction2
    case swipeAction3
    case reload
}

class ListSearchSampleViewModel: ObservableObject {
    @Published private(set) var state: ListSearchSampleViewState = .init()
    
    func send(_ action: ListSearchSampleViewAction) {
        switch action {
        case .search(let newText):
            self.state.searchText = newText
            self.state.suggestions = self.state.rowDatas.filter({$0.localizedStandardContains(newText)})
            break
        case .swipeAction1:
            break
        case .swipeAction2:
            break
        case .swipeAction3:
            break
        case .reload:
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {[weak self] in
                guard let self = self else { return }
                if self.state.rowDatas.count > 31 {
                    self.state.rowDatas = RandomData.randamDatas
                }else{
                    self.state.rowDatas.append(contentsOf: RandomData.randomDatas2)
                }
            }
            
        }
    }
}

struct ListSearchSampleView: View {
    @StateObject var viewModel: ListSearchSampleViewModel = .init()
    var body: some View {
        List {
            Section(header: Text("fugafuga")) {
                ForEach(viewModel.state.searchText.isEmpty ? viewModel.state.rowDatas : viewModel.state.rowDatas.filter{$0.localizedStandardContains(viewModel.state.searchText)}, id: \.self) {row in
                    
                    Text(row)
                        .badge(row.count)
                        .listRowSeparatorTint(Color.blue, edges: .all)
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button {viewModel.send(.swipeAction1)} label: {
                                Text("Action 1")
                            }
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button {viewModel.send(.swipeAction2)} label: {
                                Text("Action 2")
                            }
                            .tint(Color.red)
                            Button {viewModel.send(.swipeAction3)} label: {
                                Text("Action 3")
                            }
                            .tint(Color.blue)
                        }
                }
            }
            .listSectionSeparator(.visible, edges: .all)
            .listSectionSeparatorTint(Color.red, edges: .all)
            
        }
        .refreshable {
            viewModel.send(.reload)
        }
        .listStyle(.grouped)
        .searchable("検索", text: .init(get: {viewModel.state.searchText}, set: {viewModel.send(.search(newText: $0))}), placement: .navigationBarDrawer(displayMode: .always)) {
            ForEach(viewModel.state.suggestions, id: \.self) {suggest in
                Text(suggest)
                    .searchCompletion(suggest)
            }
        }
        .navigationTitle("Title")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ListSearchSampleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListSearchSampleView()
        }
    }
}



fileprivate struct RandomData {
    static var randamDatas: [String] {
        [
            "Takeda Yoshitarou",
            "Fukumoto Yuuki",
            "Nagaoka Nobuo",
            "Fukuzawa Ayano",
            "Koube Kamejirou",
            "Nagao Kazuhiro",
            "Takahata Hiroto",
            "Igarashi Mitsuo",
            "Odaka Keigo",
            "Araki Yoshinori",
            "Tamura Hiroyuki",
            "Fuse Mitsunari",
            "Kakiuchi Shoujirou",
            "Meguro Kazuyo",
            "Kita Kokoro",
            "Taguchi Hideyuki",
            "Tawara Takayoshi",
            "Aoki Mariko",
            "Ariga Kunio",
            "Doi Shinichirou",
            "Kitaoka Maika",
            "Oonuma Aina",
            "Wada Tatsuo",
            "Akimoto Mai",
            "Yamaguchi Rina",
            "Kokubo Yoshiko",
            "Oomura Yui",
            "Shouji Reika",
            "Handa Yuuta",
            "Oonuki Sakura",
        ]
    }
    
    static var randomDatas2: [String] {
        [
            "Inagaki Yasuyo",
            "Oosawa Kazuhiko",
            "Sugiyama Mikiko",
            "Egawa Yoshirou",
            "Ookuma Naoko",
            "Akasaka Tomoko",
            "Shimabukuro Fuuka",
            "Kanamori Narumitsu",
            "Dekuchi Yuzuki",
            "Iwase Shion",
            "Inagaki Airi",
            "Ooba Tadayoshi",
            "Uchimura Kouta",
        ]
    }
}
