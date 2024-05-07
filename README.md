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
            appGroupIdentifier: "your.app.group.id",
            target: .iOSAppClip
        )
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { userActivity in
                    Burst.shared.handleLink(userActivity.webpageURL) { linkData in
                        // do something with link data
                    }
                }
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
    
    init() {
        Burst.initialize(
            accessKey: "YOUR_ACCESS_KEY",
            appGroupIdentifier: "your.app.group.id",
            target: .iOSApp
        )
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { userActivity in
                    Burst.shared.handleLink(userActivity.webpageURL) { linkData in
                        // do something with linkData
                    }
                }
                .onAppear {
                    if Burst.shared.transitioningFromAppClip {
                        Burst.shared.resumeExperience()
                    }
                }
        }
    }
}
```
