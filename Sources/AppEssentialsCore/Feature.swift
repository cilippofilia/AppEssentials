import Foundation

/// One feature shown in the changelog and on the What's New screen.
///
/// Text is a `LocalizedStringResource`, so string literals you pass are looked up in your app's String Catalog.
public struct Feature: Identifiable, Sendable {
    public let id = UUID()
    public let title: LocalizedStringResource
    public let detail: LocalizedStringResource?
    public let systemImage: String?

    public init(title: LocalizedStringResource, detail: LocalizedStringResource? = nil, systemImage: String? = nil) {
        self.title = title
        self.detail = detail
        self.systemImage = systemImage
    }
}
