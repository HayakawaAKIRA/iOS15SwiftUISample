//
//  SampleActionSheetView.swift
//  SampleiOS15_1_202106
//
//  Created by 61-201507-2184 on 2021/06/16.
//

import SwiftUI

struct DialogData {
    var detail: String
    var subDetail: String?
}

struct SampleActionSheetView: View {
    
    @State private var showActionSheet: Bool = false
    @State private var showActionSheet2: Bool = false

    @State private var title: String = ""
    @State private var titleVisibility: Visibility = .visible
    @State private var data: DialogData? = nil
    
    @State private var detail: String = ""
    @State private var subdetail: String = ""

    var body: some View {
        ScrollView {
            LazyVStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("title")
                        .font(.system(size: 12))
                    TextField("Title", text: $title)
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Detail")
                        .font(.system(size: 12))
                    TextField("Detail", text: $detail)
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Sub detail")
                        .font(.system(size: 12))
                    TextField("subdetail", text: $subdetail)
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Title Visibility")
                        .font(.system(size: 12))
                    Toggle("visibility", isOn: .init(get: {titleVisibility == .visible}, set: {titleVisibility = $0 ? .visible : .hidden}))
                }
                .padding()
                
                Button {
                    data = DialogData(detail: detail, subDetail: subdetail)
                    showActionSheet.toggle()
                } label: {
                    Text("Show ActionSheet")
                }
                .buttonStyle(.bordered)
                .padding()
                
                Button {
                    data = DialogData(detail: detail, subDetail: subdetail)
                    showActionSheet2.toggle()
                } label: {
                    Text("Show ActionSheet2")
                }
                .buttonStyle(.bordered)
                .padding()
            }
        }
        .confirmationDialog(title, isPresented: $showActionSheet, titleVisibility: titleVisibility, presenting: data) { _data in
            Button {
                
            } label: {
                Text(_data.detail)
            }
            Button {
                
            } label: {
                Text(_data.subDetail ?? "sub")
            }
        } message: { _data in
            Text("confirmationDialog message: \(_data.detail)")
        }
        .confirmationDialog("Type2:" + title, isPresented: $showActionSheet2, titleVisibility: titleVisibility, presenting: data) { _data in
            Button {
                
            } label: {
                Text(_data.detail)
            }
            Button {
                
            } label: {
                Text(_data.subDetail ?? "sub")
            }
        } message: { _data in
            Text("type2 confirmationDialog message: \(_data.detail)")
        }

        
    }
}

struct SampleActionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        SampleActionSheetView()
    }
}
