import Foundation

/// One numbered step in `WidgetGuideView`.
public struct WidgetGuideStep: Sendable {
    public let systemImage: String
    public let title: LocalizedStringResource
    public let detail: LocalizedStringResource

    public init(systemImage: String, title: LocalizedStringResource, detail: LocalizedStringResource) {
        self.systemImage = systemImage
        self.title = title
        self.detail = detail
    }

    /// The system steps for adding any app's widget.
    static func standard(appName: String) -> [WidgetGuideStep] {
        #if os(macOS)
        [
            WidgetGuideStep(
                systemImage: "contextualmenu.and.cursorarrow",
                title: .module("Open the widget gallery"),
                detail: .module("Control-click the desktop and choose Edit Widgets.")
            ),
            search(appName: appName),
            WidgetGuideStep(
                systemImage: "hand.draw",
                title: .module("Drag it to the desktop"),
                detail: .module("Drag the widget you want onto the desktop.")
            )
        ]
        #else
        [
            WidgetGuideStep(
                systemImage: "hand.tap",
                title: .module("Touch and hold the Home Screen"),
                detail: .module("Press and hold an empty area until the apps start to jiggle.")
            ),
            WidgetGuideStep(
                systemImage: "plus.circle",
                title: .module("Tap the Edit button, then Add Widget"),
                detail: .module("A button appears in the top corner of the screen while the apps are jiggling.")
            ),
            search(appName: appName),
            WidgetGuideStep(
                systemImage: "square.resize",
                title: .module("Pick a size and add it"),
                detail: .module("Swipe between the available sizes, then tap Add Widget.")
            )
        ]
        #endif
    }

    private static func search(appName: String) -> WidgetGuideStep {
        WidgetGuideStep(
            systemImage: "magnifyingglass",
            title: .module("Search for \(appName)"),
            detail: .module("Type “\(appName)” in the search field to find the widget.")
        )
    }
}
