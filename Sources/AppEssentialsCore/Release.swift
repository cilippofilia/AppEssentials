import Foundation

/// One app release. Mark big releases with `isMajor` to show them on the What's New screen.
public struct Release: Identifiable, Sendable {
    public let version: String
    public let date: Date?
    public let isMajor: Bool
    public let features: [Feature]

    public var id: String { version }

    public init(version: String, date: Date? = nil, isMajor: Bool = false, features: [Feature]) {
        self.version = version
        self.date = date
        self.isMajor = isMajor
        self.features = features
    }
}
