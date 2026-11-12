import AppEssentialsCore
import SwiftUI

/// Asks whether to report a bug or send another enquiry, then emails the developer.
public struct ContactRow: View {
    let info: AppInfo
    @Environment(\.openURL) private var openURL
    @State private var showsOptions = false

    public init(info: AppInfo) {
        self.info = info
    }

    public var body: some View {
        Button {
            showsOptions = true
        } label: {
            AboutRow(.module("Contact the developer"), systemImage: "envelope", tint: .primary)
        }
        .buttonStyle(.plain)
        .confirmationDialog(
            Text(LocalizedStringResource.module("Select an option")),
            isPresented: $showsOptions,
            titleVisibility: .visible
        ) {
            Button {
                openMail(
                    subject: "Bug Report",
                    body: "Please describe the bug in as much detail as you can, and attach screenshots if possible."
                )
            } label: {
                Text(LocalizedStringResource.module("Report a bug"))
            }

            Button {
                openMail(subject: "Enquiry")
            } label: {
                Text(LocalizedStringResource.module("Other Enquiry"))
            }
        }
    }

    // Subjects and bodies stay in English: they are read by the developer.
    private func openMail(subject: String, body: String = "") {
        if let url = info.mailURL(subject: subject, body: body) {
            openURL(url)
        }
    }
}
