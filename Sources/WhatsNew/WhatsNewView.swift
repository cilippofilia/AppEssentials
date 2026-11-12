import AppEssentialsCore
import SwiftUI

/// The top features of a major release, with a Continue button.
public struct WhatsNewView: View {
    let release: Release

    public init(release: Release) {
        self.release = release
    }

    public var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                VStack {
                    Text(LocalizedStringResource.module("What's New"))
                        .font(.largeTitle)
                        .bold()
                    Text(LocalizedStringResource.module("Version \(release.version)"))
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
            ContinueButton()
                .padding()
        }
        #if os(macOS)
        .frame(minWidth: 420, minHeight: 520)
        #endif
    }
}

private struct ContinueButton: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button {
            dismiss()
        } label: {
            Text(LocalizedStringResource.module("Continue"))
        }
        .controlSize(.large)
        .modifier(ProminentButtonStyle())
    }
}

/// Liquid Glass on iOS 26 and macOS 26, the bordered style before that.
private struct ProminentButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 26, macOS 26, *) {
            content.buttonStyle(.glassProminent)
        } else {
            content.buttonStyle(.borderedProminent)
        }
    }
}
