import AppEssentialsCore
import SwiftUI

/// Shares the app's App Store link.
public struct ShareRow: View {
    let info: AppInfo

    public init(info: AppInfo) {
        self.info = info
    }

    public var body: some View {
        if let url = info.appStoreURL {
            ShareLink(item: url) {
                AboutRow(.module("Share the app"), systemImage: "square.and.arrow.up")
            }
            .buttonStyle(.plain)
        }
    }
}
