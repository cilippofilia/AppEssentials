import SwiftUI

/// Icon, title and detail for a single feature.
public struct FeatureRow: View {
    let feature: Feature

    public init(feature: Feature) {
        self.feature = feature
    }

    public var body: some View {
        Label {
            VStack(alignment: .leading) {
                Text(feature.title)
                    .bold()
                Text(feature.detail)
                    .foregroundStyle(.secondary)
            }
        } icon: {
            Image(systemName: feature.systemImage)
                .foregroundStyle(.tint)
        }
    }
}
