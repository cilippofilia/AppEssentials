import AppEssentialsCore
import SwiftUI

public extension View {
    /// Apply to the `List` or `Form` that contains the About rows, inside a `NavigationStack`.
    func aboutDestinations(info: AppInfo, releases: [Release], widgetGuide: WidgetGuide = WidgetGuide()) -> some View {
        aboutDestinations(info: info, releases: releases, widgetGuide: widgetGuide) {
            WidgetGuideSymbol(systemImage: widgetGuide.systemImage)
        }
    }

    /// Like `aboutDestinations(info:releases:widgetGuide:)`, with your own artwork above the widget guide's intro.
    func aboutDestinations<Artwork: View>(
        info: AppInfo,
        releases: [Release],
        widgetGuide: WidgetGuide,
        @ViewBuilder widgetGuideArtwork: @escaping () -> Artwork
    ) -> some View {
        navigationDestination(for: AboutDestination.self) { destination in
            switch destination {
            case .changelog:
                ChangelogView(releases: releases)
            case .widgetGuide:
                WidgetGuideView(appName: info.name, guide: widgetGuide, artwork: widgetGuideArtwork)
            }
        }
    }
}
