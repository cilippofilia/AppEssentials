import AppEssentialsCore
import SwiftUI

/// The top features of a major release, with a Continue button.
public struct WhatsNewView: View {
    let release: Release
    @Environment(\.dismiss) private var dismiss

    public init(release: Release) {
        self.release = release
    }

    public var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                VStack {
                    Text("What's New")
                        .font(.largeTitle)
                        .bold()
                    Text("Version \(release.version)")
                        .foregroundStyle(.secondary)
                }
                VStack(alignment: .leading, spacing: 24) {
                    ForEach(release.features.prefix(WhatsNew.featureLimit)) { feature in
                        FeatureRow(feature: feature)
                    }
                }
            }
            .padding()
            .padding(.top, 32)
        }
        .safeAreaInset(edge: .bottom) {
            Button("Continue") {
                dismiss()
            }
            .buttonStyle(.glassProminent)
            .controlSize(.large)
            .padding()
        }
    }
}
