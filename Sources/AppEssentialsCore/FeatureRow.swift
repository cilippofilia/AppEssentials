import SwiftUI

/// A feature's title and optional detail, with its icon when it has one.
public struct FeatureRow: View {
    let feature: Feature

    public init(feature: Feature) {
        self.feature = feature
    }

    public var body: some View {
        if let systemImage = feature.systemImage {
            Label {
                FeatureText(feature: feature)
            } icon: {
                Image(systemName: systemImage)
                    .foregroundStyle(.tint)
            }
        } else {
            FeatureText(feature: feature)
        }
    }
}

private struct FeatureText: View {
    let feature: Feature

    var body: some View {
        VStack(alignment: .leading) {
            Text(feature.title)
                .bold(feature.detail != nil)
            if let detail = feature.detail {
                Text(detail)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
