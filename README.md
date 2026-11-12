<p align="center">
  <img src="https://img.shields.io/badge/iOS-26.0+-b96229.svg" alt="iOS 26.0+" />
  <img src="https://img.shields.io/badge/macOS-26.0+-2980b9.svg" alt="macOS 26.0+" />
  <img src="https://img.shields.io/badge/Swift-6.2+-8e44ad.svg" alt="Swift 6.2+" />
</p>

# AppEssentials

The SwiftUI screens most apps need: an About section for settings and a What's New sheet for major releases.

## About

AppEssentials ships two libraries you can adopt separately:

- **AboutSection**: drop-in `Section`s for a settings `Form` or `List`. They include a changelog, a feature-suggestion email, a guide to adding widgets, a link to rate the app, a contact email for the developer, a share link, and a footer with the app version and build.
- **WhatsNew**: a sheet that shows the top three features of your latest major release once, then stays hidden until the next major release.

Both read from a single list of `Release` values that you define in your app, so the changelog and the What's New sheet can't drift apart.

## Installation

Add the package in Xcode with **File → Add Package Dependencies…** and this URL:

```
https://github.com/cilippofilia/AppEssentials
```

Or add it to `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/cilippofilia/AppEssentials", branch: "main")
]
```

Then add `AboutSection`, `WhatsNew`, or both to your target.

## Usage

### 1. Describe your app and releases

```swift
import AboutSection // or WhatsNew; both expose AppInfo, Release and Feature

let info = AppInfo(appStoreID: "1234567890", developerEmail: "you@example.com")

let releases: [Release] = [
    Release(version: "2.1", date: .now, features: [
        Feature(title: "Faster sync", detail: "Changes appear instantly.", systemImage: "bolt")
    ]),
    Release(version: "2.0", date: .now, isMajor: true, features: [
        Feature(title: "Widgets", detail: "Glance at your stats.", systemImage: "square.grid.2x2"),
        Feature(title: "Dark icons", detail: "Match your Home Screen.", systemImage: "moon"),
        Feature(title: "Search", detail: "Find anything in seconds.", systemImage: "magnifyingglass")
    ])
]
```

`AppInfo` reads the app's name, version and build from `Bundle.main`.

### 2. Add the About section to settings

```swift
import AboutSection

NavigationStack {
    Form {
        // Your own sections…
        AboutSection(info: info)
    }
    .aboutDestinations(info: info, releases: releases)
}
```

`.aboutDestinations(info:releases:)` registers the changelog and widget guide screens, so attach it to the container inside the `NavigationStack`.

### 3. Show What's New after updates

```swift
import WhatsNew

ContentView()
    .whatsNewSheet(releases: releases)
```

The sheet appears when the newest release marked `isMajor` is newer than the last one the user saw. Versions are compared numerically, so `10.0` counts as newer than `9.0`.

If onboarding is presented over your root view, hold the sheet back until onboarding closes:

```swift
ContentView()
    .fullScreenCover(isPresented: $showOnboarding, onDismiss: { onboardingDone = true }) {
        OnboardingView()
    }
    .whatsNewSheet(releases: releases, isEnabled: onboardingDone)
```

## Requirements

- iOS 26.0+ / macOS 26.0+
- Swift 6.2+ (Xcode 26 or later)

## Project Structure

| Target | Contents |
| --- | --- |
| `AppEssentialsCore` | `AppInfo`, `Release`, `Feature`, `FeatureRow` |
| `AboutSection` | `AboutSection`, `ChangelogView`, `WidgetGuideView`, `VersionFooter` |
| `WhatsNew` | `WhatsNewView`, `.whatsNewSheet(releases:isEnabled:)`, and the show/hide logic in `WhatsNew` |

Run the tests with `swift test`.

## License

[MIT](LICENSE)
