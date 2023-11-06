<p align="center">
  <br />

  <img src=https://cdn.burst-app.com/misc/welcome-to-burst.webp alt="logo" height="200px" />
  <h3 style="font-size:30" align="center">Drive more app installs from social media</h3>
  <br />
</p>

<p align="center">
  <a href="https://burst.to">
    <img src="https://img.shields.io/badge/SwiftPM-Compatible-orange" alt="Swift Package Manager Compatible">
  </a>
  <a href="https://burst.to">
    <img src="https://img.shields.io/badge/iOS%20Version-%3E%3D%2014.0-blue" alt="Minimum iOS Target">
  </a>
</p>

----------------

## Features
- **:rocket: Optimize Social Media Marketing**: Use Burst to drive more app installs from your social media accounts. With detailed analytics, you can make informed decisions to improve your social media marketing strategies.
Burst acts as the bridge between social media and app installs, enhancing user experiences and empowering you with data-driven decision-making capabilities to maximize the impact of your social media marketing efforts.
- **:iphone: Streamlined Install Process**: Burst streamlines the app installation process, reducing user drop-offs. Users no longer have to wait for downloads from the app store, leading to a smoother user journey and increased conversions.
- **:zap: Instant App Access**: Burst enables users to open native apps instantly without the need to visit the app store. 
- **:dart: Contextual Attribution**: Burst provides context about the exact source of the app install. You can track and attribute installs to specific social media channels, or posts.
- **:chart_with_upwards_trend: Data and Insights**: Gain valuable insights into your social media-driven app installs. Burst offers comprehensive data on everything that happens between social media interactions and app installs, helping you understand what's working and what's not.

## Installation


### App Clip

Burst is designed to be user-friendly and straightforward. These two functions are all you need to remotely control your app clip experiences without redeploying your app.

```swift
//
//  ExampleAppClipApp.swift
//  ExampleAppClip
//

import SwiftUI
import BurstSDK

@main
struct ExampleAppClip: App {

    init() {
        Burst.initialize(
            accessKey: "YOUR_ACCESS_KEY",
            appGroupIdentifier: "your.app.group.id"
        )
    }

    var body: some Scene {
        WindowGroup {
            Burst.handleAppClipExperience(
              theme: .custom(background: .white, foreground: .white), // Optional
              loadingIcon: "CustomLoadingIcon" // Optional
            )
        }
    }
}
```

### App

- Track the source of installs coming through app clips
- Retrieve context about app install source from within your code
- Display app clip experiences when user already has your app installed

```swift
//
//  ExampleApp.swift
//  ExampleApp
//

import SwiftUI
import BurstSDK

@main
struct ExampleApp: App {

    @State var url: String
    @State var showingBurstExperience: Bool = false
    
    init() {
        Burst.initialize(
            accessKey: "YOUR_ACCESS_KEY",
            appGroupIdentifier: "your.app.group.id"
        )

        // Track install source
        // Displayed in analytics tab of the web dashboard
        Burst.analytics.trackInstallSourceIfFirstLaunch()

        // Retrieve the url which lead to app install
        // Returns nil if user didn't install via app clip
        Burst.analytics.getAppClipInvocationUrl()
    }
    
    var body: some Scene {
        WindowGroup {
            VStack {
                if showingBurstExperience {
                    Burst.presentExperience(
                        invocationUrl: url,
                        theme: .custom(background: .white, foreground: .white), // OPTIONAL
                        loadingIcon: "CustomLoadingIcon" // OPTIONAL
                    ) {
                        // Callback fired when user exits
                        self.showingBurstExperience = false
                    }
                } else {
                    // Your App Code
                }
            }
            .onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { userActivity in
                // OPTIONAL: Handles displaying your app clip experience if the user already has your app installed
                if let invocationUrl = userActivity.webpageURL, let invocationDomain = invocationUrl.host {
                    if invocationDomain.contains("burst.to") || invocationDomain.contains("appclip.apple.com") {
                        self.url = invocationUrl.absoluteString
                        self.showingBurstExperience = true
                    }
                }
            }
        }
    }
}
```
