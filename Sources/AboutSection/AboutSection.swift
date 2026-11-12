import AppEssentialsCore
import SwiftUI

/// Drop-in settings sections built from the individual rows, with the version and build in the footer.
/// Use the rows directly to mix them with your own.
public struct AboutSection: View {
    let info: AppInfo
    let showsWidgetGuide: Bool

    public init(info: AppInfo, showsWidgetGuide: Bool = true) {
        self.info = info
        self.showsWidgetGuide = showsWidgetGuide
    }

    public var body: some View {
        Section {
            ChangelogRow()
            SuggestFeatureRow(info: info)
            if showsWidgetGuide {
                WidgetGuideRow()
            }
        }

        Section {
            RateRow(info: info)
            ContactRow(info: info)
            ShareRow(info: info)
        } footer: {
            VersionFooter(info: info)
        }
    }
}
