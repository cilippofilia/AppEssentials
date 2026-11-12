import Foundation

/// One feature shown in the changelog and on the What's New screen.
public struct Feature: Identifiable, Sendable {
    public let id = UUID()
    public let title: String
    public let detail: String
    public let systemImage: String

    public init(title: String, detail: String, systemImage: String) {
        self.title = title
        self.detail = detail
        self.systemImage = systemImage
    }
}
