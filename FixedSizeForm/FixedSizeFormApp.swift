//
//  FixedSizeFormApp.swift
//  FixedSizeForm
//
//  Created by Developer on 6/19/25.
//

import SwiftUI

@main
struct FixedSizeFormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(width: 450, height: 300)
        }
        .windowResizability(.contentSize)

        Settings {
            SettingsView()
        }
    }
}
