import SwiftUI

/// Opens `WidgetGuideView`. Needs `.aboutDestinations(info:releases:)`.
public struct WidgetGuideRow: View {
    public init() {}

    public var body: some View {
        NavigationLink(value: AboutDestination.widgetGuide) {
            AboutRow(.module("Add a Widget"), systemImage: "widget.small.badge.plus")
        }
    }
}
