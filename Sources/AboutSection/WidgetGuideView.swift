import SwiftUI

/// Numbered instructions for adding the app's widget, followed by any app-specific steps.
public struct WidgetGuideView: View {
    let guide: WidgetGuide
    let steps: [WidgetGuideStep]

    public init(appName: String, guide: WidgetGuide = WidgetGuide()) {
        self.guide = guide
        steps = WidgetGuideStep.standard(appName: appName) + guide.extraSteps
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                if let intro = guide.intro {
                    WidgetGuideHeader(systemImage: guide.systemImage, intro: intro)
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
        .scrollBounceBehavior(.basedOnSize)
    }
}

private struct WidgetGuideHeader: View {
    let systemImage: String
    let intro: LocalizedStringResource

    var body: some View {
        VStack {
            Image(systemName: systemImage)
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.tint)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 24)
                .background(.tint.opacity(0.15), in: .rect(cornerRadius: 16))
                .accessibilityHidden(true)

            Text(intro)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
        }
    }
}
