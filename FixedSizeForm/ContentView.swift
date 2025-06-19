//
//  ContentView.swift
//  FixedSizeForm
//
//  Created by Developer on 6/19/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.openSettings) var openSettings

    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .foregroundStyle(.tint)
                .frame(width: 48, height: 48)
                .padding()

            Text("Make sure “Show scroll bars” is set to ”Always” in the “Appearance” section of System Settings, then open the Settings window by clicking the button below. Expected results: the .fixedSize() Form is not scrollable at all. Actual results: the .fixedSize() Form can scroll a pixel or two. You will be able to see the scroll thumb if you changed the setting as suggested.")

            Button("Open Settings") {
                openSettings()
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
