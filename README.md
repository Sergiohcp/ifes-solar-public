# 🚀 IFES Solar

Mobile application of IFES for simulation, comparison, and prediction of photovoltaic solar energy generation.

## 🛠 ️Environment Setup

To run the project in development mode, it is necessary to create a `.env` file in the root of the project with the variables listed in the following `.env.example` file:

```
BASE_URL=
GOOGLE_MAPS_KEY=
SOLCAST_BASE_URL=
SOLCAST_API_KEY=
```

If it does not exist, also add the GOOGLE_MAPS_KEY in this ios file:

ios/Runner/AppDelegate.swift

```
import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
