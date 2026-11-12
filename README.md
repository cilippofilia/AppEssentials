<p align="center">
  <img src="https://img.shields.io/badge/iOS-18.0+-b96229.svg" alt="iOS 18.0+" />
  <img src="https://img.shields.io/badge/macOS-15.0+-2980b9.svg" alt="macOS 15.0+" />
  <img src="https://img.shields.io/badge/Swift-6.2+-8e44ad.svg" alt="Swift 6.2+" />
</p>

# AppEssentials

The SwiftUI screens most apps need: an About section for settings and a What's New sheet for major releases.

## About

AppEssentials ships two libraries you can adopt separately:

- **AboutSection**: settings rows for a `Form` or `List`. They include a changelog, a feature-request email, a step-by-step guide to adding widgets, a link to rate the app, a contact menu (report a bug or another enquiry), a share link, and a footer with the app version and build. Use the ready-made `AboutSection`, or place the rows yourself next to your own.
- **WhatsNew**: a sheet that shows the top three features of your latest major release once, then stays hidden until the next major release.

Both read from a single list of `Release` values that you define in your app, so the changelog and the What's New sheet can't drift apart.

The package's own text is translated into English, German, Spanish, French and Italian. Text you pass in, such as feature titles, is looked up in your app's String Catalog.

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
// Optional: send "Request a Feature" to a public board instead of email.
// let info = AppInfo(appStoreID: "1234567890", developerEmail: "you@example.com",
//                    featureRequestURL: URL(string: "https://example.com/feedback"))

let releases: [Release] = [
    Release(version: "2.1", features: [
        Feature(title: "Faster sync")
    ]),
    Release(version: "2.0", isMajor: true, features: [
        Feature(title: "Widgets", detail: "Glance at your stats.", systemImage: "square.grid.2x2"),
        Feature(title: "Dark icons", detail: "Match your Home Screen.", systemImage: "moon"),
        Feature(title: "Search", detail: "Find anything in seconds.", systemImage: "magnifyingglass")
    ])
]
```

`AppInfo` reads the app's name, version and build from `Bundle.main`. A release's `date` and a feature's `detail` and `systemImage` are optional.

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

`.aboutDestinations(info:releases:)` registers the changelog and widget guide screens, so attach it to the container inside the `NavigationStack`. Pass `showsWidgetGuide: false` to `AboutSection` if your app has no widget.

To mix the rows with your own, use them directly:

```swift
Section {
    MyReadMeRow()
    ChangelogRow()
    WidgetGuideRow()
    ShareRow(info: info)
} footer: {
    VersionFooter(info: info)
}
```

The rows are `ChangelogRow`, `SuggestFeatureRow`, `WidgetGuideRow`, `RateRow`, `ContactRow` and `ShareRow`. `AboutRow` gives your own rows the same look.

To add an intro and app-specific steps to the widget guide:

```swift
.aboutDestinations(
    info: info,
    releases: releases,
    widgetGuide: WidgetGuide(
        systemImage: "wineglass.fill",
        intro: "Add the Cocktail of the Day widget for daily inspiration.",
        extraSteps: [
            WidgetGuideStep(systemImage: "slider.horizontal.3", title: "Customize it", detail: "Touch and hold the widget, then choose Edit Widget.")
        ]
    )
)
```

To show your own artwork, such as pictures from the app, in place of the symbol, add a trailing `widgetGuideArtwork:` view builder.

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

- iOS 18.0+ / macOS 15.0+ (the What's New button uses Liquid Glass on iOS 26 and macOS 26)
- Swift 6.2+ (Xcode 26 or later)

## Project Structure

| Target | Contents |
| --- | --- |
| `AppEssentialsCore` | `AppInfo`, `Release`, `Feature`, `FeatureRow` |
| `AboutSection` | `AboutSection`, the individual rows, `AboutRow`, `ChangelogView`, `WidgetGuideView`, `VersionFooter` |
| `WhatsNew` | `WhatsNewView`, `.whatsNewSheet(releases:isEnabled:)`, and the show/hide logic in `WhatsNew` |

Run the tests with `swift test`.

## License

[MIT](LICENSE)
