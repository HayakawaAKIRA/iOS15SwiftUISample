//
//  SampleAlertView.swift
//  SampleiOS15_1_202106
//
//  Created by 61-201507-2184 on 2021/06/16.
//

import SwiftUI

struct AlertDetail {
    var detail: String
    var subDetail: String?
}

enum AlertError: LocalizedError {
    case sampleError1
    case sampleError2
    
    var errorDescription: String? {
        switch self {
        case .sampleError1:
            return "Error1"
        case .sampleError2:
            return "Error2"
        }
    }
        
    var helpAnchor: String? {
        switch self {
        case .sampleError1:
            return "help1"
        case .sampleError2:
            return "help2"
        }
    }
}

struct SampleAlertView: View {
    
    @State private var title: String = ""
    @State private var detail: String = ""
    @State private var subDetail: String = ""
    
    @State private var detailData: AlertDetail?
    @State private var error: AlertError?
    
    @State private var alertShow1: Bool = false
    @State private var alertShow2: Bool = false
    
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
                    TextField("subdetail", text: $subDetail)
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                
                Button {
                    detailData = AlertDetail(detail: detail, subDetail: subDetail)
                    alertShow1.toggle()
                } label: {
                    Text("Show Alert")
                }
                .buttonStyle(.bordered)
                .padding()
                
                Divider()
                
                Button {
                    error = [AlertError.sampleError1, AlertError.sampleError2].randomElement()!
                    alertShow2.toggle()
                } label: {
                    Text("Show Error Alert")
                }
                .buttonStyle(.bordered)
                .padding()
            }
        }
        .alert(title, isPresented: $alertShow1, presenting: detailData) { detail in
            Button {
                
            } label: {
                Text(detail.detail)
            }
            Button {
                
            } label: {
                Text(detail.subDetail ?? "sub")
            }
        } message: { detail in
            Text("Alert Message: \(detail.detail)")
        }
        .alert(isPresented: $alertShow2, error: error) { _error in
            Button {
                
            } label: {
                Text("OK")
            }
            Button {
                
            } label: {
                Text(_error.helpAnchor ?? "help")
            }
        } message: { _error in
            Text("Alert from Error as: \(_error.errorDescription ?? "description")")
        }


        
    }
}

struct SampleAlertView_Previews: PreviewProvider {
    static var previews: some View {
        SampleAlertView()
    }
}
