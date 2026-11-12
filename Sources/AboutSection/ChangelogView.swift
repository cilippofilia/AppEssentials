import AppEssentialsCore
import SwiftUI

/// Every release, newest first, as passed in by the app.
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
                    Text("Version \(release.version)")
                    Spacer()
                    Text(release.date, format: .dateTime.day().month().year())
                }
            }
        }
        .navigationTitle("Changelog")
    }
}
