import SwiftUI

/// The default `WidgetGuideView` artwork: a symbol on a tinted panel.
public struct WidgetGuideSymbol: View {
    let systemImage: String

    public init(systemImage: String) {
        self.systemImage = systemImage
    }

    public var body: some View {
        Image(systemName: systemImage)
            .font(.largeTitle)
            .imageScale(.large)
            .foregroundStyle(.tint)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 24)
            .background(.tint.opacity(0.15), in: .rect(cornerRadius: 16))
    }
}
