import AppEssentialsCore
import SwiftUI

/// Emails the developer a feature request.
public struct SuggestFeatureRow: View {
    let info: AppInfo
    @Environment(\.openURL) private var openURL

    public init(info: AppInfo) {
        self.info = info
    }

    public var body: some View {
        Button {
            if let url = info.mailURL(subject: "Feature Request") {
                openURL(url)
            }
        } label: {
            AboutRow(.module("Request a Feature"), systemImage: "lightbulb", tint: .orange)
        }
        .buttonStyle(.plain)
    }
}
