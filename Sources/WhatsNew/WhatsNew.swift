import AppEssentialsCore
import Foundation

/// Decides which major release, if any, the What's New sheet should show.
public enum WhatsNew {
    /// Number of features shown on the sheet.
    public static let featureLimit = 3

    /// The newest major release, regardless of array order.
    public static func latestMajor(in releases: [Release]) -> Release? {
        releases
            .filter(\.isMajor)
            .max { $0.version.compare($1.version, options: .numeric) == .orderedAscending }
    }

    /// The newest major release if it is newer than the one the user last saw.
    public static func releaseToShow(in releases: [Release], lastSeenVersion: String?) -> Release? {
        guard let latest = latestMajor(in: releases) else { return nil }
        guard let lastSeenVersion else { return latest }
        let isNewer = latest.version.compare(lastSeenVersion, options: .numeric) == .orderedDescending
        return isNewer ? latest : nil
    }
}
