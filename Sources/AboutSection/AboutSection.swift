import AppEssentialsCore
import SwiftUI

/// Drop-in settings sections: changelog, feature suggestions, widget guide,
/// rate, contact and share, with the version and build in the footer.
public struct AboutSection: View {
    let info: AppInfo

    public init(info: AppInfo) {
        self.info = info
    }

    public var body: some View {
        Section {
            NavigationLink(value: AboutDestination.changelog) {
                Label("Changelog", systemImage: "list.bullet.rectangle")
            }
            if let url = info.mailURL(subject: "Feature Suggestion") {
                Link(destination: url) {
                    Label("Suggest a Feature", systemImage: "lightbulb")
                }
            }
            NavigationLink(value: AboutDestination.widgetGuide) {
                Label("Add Widgets", systemImage: "square.grid.2x2")
            }
        }

        Section {
            if let url = info.writeReviewURL {
                Link(destination: url) {
                    Label("Rate the App", systemImage: "star")
                }
            }
            if let url = info.mailURL(subject: "Feedback") {
                Link(destination: url) {
                    Label("Contact the Developer", systemImage: "envelope")
                }
            }
            if let url = info.appStoreURL {
                ShareLink(item: url) {
                    Label("Share \(info.name)", systemImage: "square.and.arrow.up")
                }
            }
        } footer: {
            VersionFooter(info: info)
        }
    }
}
