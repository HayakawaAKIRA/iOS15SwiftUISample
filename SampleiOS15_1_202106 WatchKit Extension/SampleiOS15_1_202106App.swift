//
//  SampleiOS15_1_202106App.swift
//  SampleiOS15_1_202106 WatchKit Extension
//
//  Created by 61-201507-2184 on 2021/06/09.
//

import SwiftUI

@main
struct SampleiOS15_1_202106App: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
