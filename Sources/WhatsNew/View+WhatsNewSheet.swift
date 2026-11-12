import AppEssentialsCore
import SwiftUI

public extension View {
    /// Shows `WhatsNewView` once for each new major release. Apply to the app's root view.
    ///
    /// - Parameter isEnabled: Hold the sheet back while something else is presented, such as
    ///   onboarding. Flip it to `true` in that presentation's `onDismiss`, not before, so the
    ///   two presentations never overlap.
    func whatsNewSheet(releases: [Release], isEnabled: Bool = true) -> some View {
        modifier(WhatsNewSheetModifier(releases: releases, isEnabled: isEnabled))
    }
}

struct WhatsNewSheetModifier: ViewModifier {
    let releases: [Release]
    let isEnabled: Bool
    @AppStorage("AppEssentials.lastSeenWhatsNewVersion") private var lastSeenVersion: String?
    @State private var release: Release?

    func body(content: Content) -> some View {
        content
            .task(id: isEnabled) {
                guard isEnabled,
                      let next = WhatsNew.releaseToShow(in: releases, lastSeenVersion: lastSeenVersion) else { return }
                release = next
                // Marked as seen on presentation so a swipe-to-dismiss counts too.
                lastSeenVersion = next.version
            }
            .sheet(item: $release) { release in
                WhatsNewView(release: release)
            }
    }
}
