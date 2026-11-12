import SwiftUI

/// A numbered circle beside a step's title and detail.
struct WidgetGuideStepRow: View {
    let number: Int
    let step: WidgetGuideStep

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Text(number, format: .number)
                .font(.headline)
                .foregroundStyle(.white)
                .frame(width: 28, height: 28)
                .background(.tint, in: .circle)

            VStack(alignment: .leading, spacing: 4) {
                Label {
                    Text(step.title)
                } icon: {
                    Image(systemName: step.systemImage)
                }
                .font(.headline)

                Text(step.detail)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .accessibilityElement(children: .combine)
    }
}
