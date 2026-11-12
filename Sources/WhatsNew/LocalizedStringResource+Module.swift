import Foundation

extension LocalizedStringResource {
    /// A string from this package's String Catalog rather than the app's.
    static func module(_ key: String.LocalizationValue) -> LocalizedStringResource {
        LocalizedStringResource(key, bundle: .atURL(Bundle.module.bundleURL))
    }
}
