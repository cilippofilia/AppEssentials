import AppEssentialsCore
import SwiftUI

/// Opens the App Store's write-a-review page.
public struct RateRow: View {
    let info: AppInfo
    @Environment(\.openURL) private var openURL

    public init(info: AppInfo) {
        self.info = info
    }

    public var body: some View {
        Button {
            if let url = info.writeReviewURL {
                openURL(url)
            }
        } label: {
            AboutRow(.module("Rate the app"), systemImage: "star.fill", tint: .yellow)
        }
        .buttonStyle(.plain)
    }
}
