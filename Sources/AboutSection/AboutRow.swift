import SwiftUI

/// A settings row with a tinted icon, matching the rows `AboutSection` uses.
public struct AboutRow: View {
    let title: LocalizedStringResource
    let systemImage: String
    let tint: Color

    public init(_ title: LocalizedStringResource, systemImage: String, tint: Color = .secondary) {
        self.title = title
        self.systemImage = systemImage
        self.tint = tint
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: systemImage)
                .foregroundStyle(tint)
                .frame(minWidth: 30, minHeight: 30)
                .accessibilityHidden(true)

            Text(title)
                .foregroundStyle(.primary)
        }
        .accessibilityElement(children: .combine)
    }
}
