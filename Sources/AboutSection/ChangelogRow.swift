import SwiftUI

/// Opens `ChangelogView`. Needs `.aboutDestinations(info:releases:)`.
public struct ChangelogRow: View {
    public init() {}

    public var body: some View {
        NavigationLink(value: AboutDestination.changelog) {
            AboutRow(.module("Changelog"), systemImage: "list.bullet.rectangle")
        }
    }
}
