import SwiftUI

/// Step-by-step instructions for adding the app's widgets.
public struct WidgetGuideView: View {
    let appName: String

    public init(appName: String) {
        self.appName = appName
    }

    private var steps: [String] {
        #if os(macOS)
        [
            "Control-click the desktop and choose Edit Widgets.",
            "Search for \(appName).",
            "Drag the widget you want onto the desktop."
        ]
        #else
        [
            "Touch and hold an empty area of the Home Screen until the apps jiggle.",
            "Tap Edit, then Add Widget.",
            "Search for \(appName).",
            "Choose a size, then tap Add Widget."
        ]
        #endif
    }

    public var body: some View {
        List(steps.enumerated(), id: \.offset) { index, step in
            Label(step, systemImage: "\(index + 1).circle.fill")
        }
        .navigationTitle("Add Widgets")
    }
}
