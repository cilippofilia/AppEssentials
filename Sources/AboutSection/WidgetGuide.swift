import Foundation

/// App-specific additions to `WidgetGuideView`'s standard steps.
public struct WidgetGuide: Sendable {
    public var systemImage: String
    public var intro: LocalizedStringResource?
    public var extraSteps: [WidgetGuideStep]

    /// - Parameters:
    ///   - systemImage: Shown in the header above `intro`.
    ///   - intro: Explains what the widget does. The header is hidden when this is `nil`.
    ///   - extraSteps: Shown after the standard steps, for example how to configure the widget.
    public init(
        systemImage: String = "widget.small.badge.plus",
        intro: LocalizedStringResource? = nil,
        extraSteps: [WidgetGuideStep] = []
    ) {
        self.systemImage = systemImage
        self.intro = intro
        self.extraSteps = extraSteps
    }
}
