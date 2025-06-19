# Sample Project for FB18212090

This project demonstrates a SwiftUI layout bug. The code includes a `TabView` containing a `Form` that has `.fixedSize(horizontal: false, vertical: true)` set on it. This should cause the containing `Tab`, `TabView`, and (ultimately) window to allocate enough vertical space so that there is no scrolling in this view.

This works…until a trivial `NSViewRepresentable` view (`InnocentNSView`) is added to the `ZStack` that contains the `TabView`. The mere presence of this entirely empty `NSViewRepresentable` view causes the height calculation to be off by a pixel or two, which causes the `Form` to have a tiny bit of scrolling.

If you set “Show scroll bars” to ”Always” in the “Appearance” section of System Settings, you can see the scroll thumb that should not be visible in this view. You can also try scrolling the view to see that it moves up and down a pixel or two. If you [comment out the `InnocentNSView()` in the view code](https://github.com/siracusa/FixedSizeForm/blob/main/FixedSizeForm/SettingsView.swift#L29), the unexpected scrolling goes away and everything works as expected.

See the code in [SettingsView.swift](https://github.com/siracusa/FixedSizeForm/blob/23ec3eb53196d92725c8acc47aa3d35c6a3cb4ac/FixedSizeForm/SettingsView.swift#L24) for more information.

<img src="https://github.com/siracusa/FixedSizeForm/blob/main/screenshot.png?raw=true" width=537 alt="Screenshot">
