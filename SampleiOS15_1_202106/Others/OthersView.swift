//
//  OthersView.swift
//  SampleiOS15_1_202106
//
//  Created by 61-201507-2184 on 2021/06/16.
//

import SwiftUI

enum Others: String, Identifiable, CaseIterable, View {
    var id: String { rawValue }
    
    case alert
    case actionsheet
    
    var body: some View {
        switch self {
        case .alert:
            SampleAlertView()
        case .actionsheet:
            SampleActionSheetView()
        }
    }
}

struct OthersView: View {
    
    var others: [Others] = Others.allCases
    
    var body: some View {
        List {
            ForEach(others) {other in
                NavigationLink(destination: other) {
                    Text(other.rawValue)
                }
                .id(UUID())
            }
        }
        .navigationTitle("Others")
    }
}

struct OthersView_Previews: PreviewProvider {
    static var previews: some View {
        OthersView()
    }
}
