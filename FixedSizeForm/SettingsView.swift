//
//  SettingsView.swift
//  FixedSizeForm
//
//  Created by Developer on 6/19/25.
//

import AppKit
import SwiftUI

struct InnocentNSView : NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        return NSView()
    }

    func updateNSView(_ nsView: NSView, context: Context) { }
}

struct SettingsView : View {
    @State private var selectedTab = 1

    var body: some View {
        return ZStack {
            // BUG EXPLANATION:
            //
            // Comment out this innocent, empty NSViewRepresentable view
            // to eliminate the tiny amount of scolling in what should be
            // a .fixedSize() Form below.
            InnocentNSView()

            VStack {
                TabView(selection: .constant(1)) {
                    Tab("General", systemImage: "gearshape", value: 1) {
                        Form {
                            Section {
                                VStack(alignment: .leading, spacing: 3.5) {
                                    LabeledContent("Heading") { }

                                    Text(
                                        """
                                        The Form { … } containing this Text() has .fixedSize(horizontal: false, vertical: true) set on it. This should cause the containing Tab, TabView, and (ultimately) window to allocate enough vertical space so that there is no scrolling in this view.

                                        This works…until a trivial NSViewRepresentable view (InnocentNSView) is added to the ZStack that contains the TabView, etc. The mere presence of this entirely empty NSViewRepresentable view causes the height calculation to be off by a pixel or two, which causes the Form to have a tiny bit of scrolling.

                                        If you set “Show scroll bars” to ”Always” in the “Appearance” section of System Settings, you can see the scroll thumb that should not be visible in this view. You can also try scrolling this text to see that it moves up and down a pixel or two. If you comment out the InnocentNSView() in the view code, the unexpected scrolling goes away and everything works as expected.
                                        """
                                    )
                                }
                            }  header: {
                                Text("Section")
                            }
                        }
                        .formStyle(.grouped)
                        // This should make it so the Form does not scroll at all,
                        // but the presence of the InnocentNSView() somehow prevents
                        // this and causes a pixel or two of scrolling.
                        .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
        }
        .frame(width: 425)
    }
}

#Preview {
    SettingsView()
}
