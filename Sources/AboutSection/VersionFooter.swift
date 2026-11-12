import AppEssentialsCore
import SwiftUI

/// "AppName 1.2 (34)", centered under the last section.
public struct VersionFooter: View {
    let info: AppInfo

    public init(info: AppInfo) {
        self.info = info
    }

    public var body: some View {
        Text("\(info.name) \(info.version) (\(info.build))")
            .frame(maxWidth: .infinity)
            .textSelection(.enabled)
    }
}
