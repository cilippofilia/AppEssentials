import AppEssentialsCore
import SwiftUI

public extension View {
    /// Apply to the `List` or `Form` that contains `AboutSection`, inside a `NavigationStack`.
    func aboutDestinations(info: AppInfo, releases: [Release]) -> some View {
        navigationDestination(for: AboutDestination.self) { destination in
            switch destination {
            case .changelog:
                ChangelogView(releases: releases)
            case .widgetGuide:
                WidgetGuideView(appName: info.name)
            }
        }
    }
}
