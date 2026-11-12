import AppEssentialsCore
import SwiftUI

/// Opens the app's feature board, or emails the developer a feature request when there is none.
public struct SuggestFeatureRow: View {
    let info: AppInfo
    @Environment(\.openURL) private var openURL
    @State private var showsMailFallback = false

    public init(info: AppInfo) {
        self.info = info
    }

    public var body: some View {
        Button {
            if let board = info.featureRequestURL {
                openURL(board)
            } else {
                requestByMail()
            }
        } label: {
            AboutRow(.module("Request a Feature"), systemImage: "lightbulb", tint: .primary)
        }
        .buttonStyle(.plain)
        .mailFallbackAlert(isPresented: $showsMailFallback, email: info.developerEmail)
    }

    private func requestByMail() {
        // Unlike the subject, these prompts are read by the person writing, so they are localized.
        let body = [
            String(localized: .module("What would you like \(info.name) to do?")),
            String(localized: .module("When would you use it?"))
        ].joined(separator: "\n\n\n\n")

        guard let url = info.mailURL(subject: "Feature Request", body: body + "\n\n") else { return }
        openURL(url) { accepted in
            if !accepted { showsMailFallback = true }
        }
    }
}
