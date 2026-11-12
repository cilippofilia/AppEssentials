import Foundation

/// Static details about the host app, passed in once by each app.
public struct AppInfo: Sendable {
    public let appStoreID: String
    public let developerEmail: String
    public let name: String
    public let version: String
    public let build: String

    public init(appStoreID: String, developerEmail: String, bundle: Bundle = .main) {
        self.appStoreID = appStoreID
        self.developerEmail = developerEmail
        name = bundle.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
            ?? bundle.object(forInfoDictionaryKey: "CFBundleName") as? String
            ?? ""
        version = bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "?"
        build = bundle.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "?"
    }

    public var appStoreURL: URL? {
        URL(string: "https://apps.apple.com/app/id\(appStoreID)")
    }

    public var writeReviewURL: URL? {
        URL(string: "https://apps.apple.com/app/id\(appStoreID)?action=write-review")
    }

    /// A `mailto:` link to the developer with the app version appended, so bug reports carry it.
    public func mailURL(subject: String) -> URL? {
        var components = URLComponents()
        components.scheme = "mailto"
        components.path = developerEmail
        components.queryItems = [
            URLQueryItem(name: "subject", value: "\(name) – \(subject)"),
            URLQueryItem(name: "body", value: "\n\n—\n\(name) \(version) (\(build))")
        ]
        return components.url
    }
}
