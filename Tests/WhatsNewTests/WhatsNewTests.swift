import AppEssentialsCore
import Foundation
import Testing
@testable import WhatsNew

struct WhatsNewTests {
    private func release(_ version: String, major: Bool) -> Release {
        Release(version: version, date: .now, isMajor: major, features: [])
    }

    @Test func showsLatestMajorOnFirstLaunch() {
        let releases = [release("2.1", major: false), release("2.0", major: true), release("1.0", major: true)]
        #expect(WhatsNew.releaseToShow(in: releases, lastSeenVersion: nil)?.version == "2.0")
    }

    @Test func hidesWhenAlreadySeen() {
        let releases = [release("2.1", major: false), release("2.0", major: true)]
        #expect(WhatsNew.releaseToShow(in: releases, lastSeenVersion: "2.0") == nil)
    }

    @Test func minorReleaseDoesNotRetrigger() {
        let releases = [release("2.2", major: false), release("2.0", major: true)]
        #expect(WhatsNew.releaseToShow(in: releases, lastSeenVersion: "2.0") == nil)
    }

    @Test func comparesVersionsNumerically() {
        let releases = [release("9.0", major: true), release("10.0", major: true)]
        #expect(WhatsNew.latestMajor(in: releases)?.version == "10.0")
        #expect(WhatsNew.releaseToShow(in: releases, lastSeenVersion: "9.0")?.version == "10.0")
    }

    @Test func noMajorReleasesShowsNothing() {
        #expect(WhatsNew.releaseToShow(in: [release("1.1", major: false)], lastSeenVersion: nil) == nil)
    }
}
