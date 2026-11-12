import AppEssentialsCore
import SwiftUI

/// Every release in the order the app passes them, usually newest first.
public struct ChangelogView: View {
    let releases: [Release]

    public init(releases: [Release]) {
        self.releases = releases
    }

    public var body: some View {
        List(releases) { release in
            Section {
                ForEach(release.features) { feature in
                    FeatureRow(feature: feature)
                }
            } header: {
                HStack {
                    Text(LocalizedStringResource.module("Version \(release.version)"))
                    Spacer()
                    if let date = release.date {
                        Text(date, format: .dateTime.day().month().year())
                    }
                }
            }
        }
        .navigationTitle(Text(LocalizedStringResource.module("Changelog")))
    }
}
