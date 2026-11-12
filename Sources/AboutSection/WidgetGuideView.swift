import SwiftUI

/// Numbered instructions for adding the app's widget, followed by any app-specific steps.
public struct WidgetGuideView<Artwork: View>: View {
    let guide: WidgetGuide
    let steps: [WidgetGuideStep]
    let artwork: Artwork

    /// - Parameter artwork: Shown above the intro in place of the guide's symbol, for example
    ///   pictures from the app. Only shown when the guide has an intro.
    public init(appName: String, guide: WidgetGuide = WidgetGuide(), @ViewBuilder artwork: () -> Artwork) {
        self.guide = guide
        steps = WidgetGuideStep.standard(appName: appName) + guide.extraSteps
        self.artwork = artwork()
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                if let intro = guide.intro {
                    VStack {
                        artwork
                            .accessibilityHidden(true)

                        Text(intro)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.secondary)
                    }
                }

                ForEach(steps.indices, id: \.self) { index in
                    WidgetGuideStepRow(number: index + 1, step: steps[index])
                }
            }
            .frame(maxWidth: 700)
            .frame(maxWidth: .infinity)
            .padding()
        }
        .navigationTitle(Text(LocalizedStringResource.module("Add a Widget")))
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        .scrollBounceBehavior(.basedOnSize)
    }
}

public extension WidgetGuideView where Artwork == WidgetGuideSymbol {
    /// Shows the guide's `systemImage` above the intro.
    init(appName: String, guide: WidgetGuide = WidgetGuide()) {
        self.init(appName: appName, guide: guide) {
            WidgetGuideSymbol(systemImage: guide.systemImage)
        }
    }
}
