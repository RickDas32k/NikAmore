# PineApple Music

An aesthetic and highly functional Android music player client.

## Features

- **Search, Browse, and Play**: Stream tracks directly.
- **Offline Downloads**: Save songs on your device for offline listening.
- **Synced Lyrics**: Follow along with time-synced lyrics.
- **Audio Equalizer & Pipeline**: Fine-tune your audio experience with dynamic and manual equalizers.
- **Discord Rich Presence**: Share what you're listening to on Discord.
- **Scrobbling**: Log your listening history to Last.fm and ListenBrainz.
- **Listen Together**: Sync music playback with friends in real-time.
- **Adaptive UI**: Dynamic colors and material design layouts for mobile and TV.

## Technology Stack

- **Language**: Kotlin
- **UI Framework**: Jetpack Compose
- **Media**: Media3 / ExoPlayer
- **Architecture**: MVI / MVVM with Kotlin Coroutines & Flow
- **Build System**: Gradle

## Project Structure

- `app/` - The main Android application.
- `shared/` - Shared business logic and data layer.
- `sharedUi/` - Shared UI components and Jetpack Compose resources.
- `tv/` - Android TV application.
- `wearos/` - Wear OS companion application.

## Prerequisites

- JDK 17 or higher
- Android Studio (latest stable or preview)
- Android SDK (API 34+)

## Setup Instructions

1. Clone the repository to your local machine.
2. Open the project in Android Studio.
3. Allow Gradle to sync and download all dependencies.
4. If you have a custom keystore for releases, create `keystore.properties` from `keystore.properties.example`.

## Build Commands

To build the debug variants from the command line:

```bash
# Build the developer debug APK for the phone app
./gradlew :app:assembleDevDebug

# Build the production debug APK for the phone app
./gradlew :app:assembleProdDebug
```

## Installation Instructions

1. Locate the generated APK in `app/build/outputs/apk/dev/debug/` or `app/build/outputs/apk/prod/debug/`.
2. Transfer the APK to your Android device, or install it directly via `adb`:
```bash
adb install app/build/outputs/apk/dev/debug/app-dev-debug.apk
```

## App Configuration

No special configuration is required for standard usage. If you wish to use Discord Rich Presence or Scrobbling, those can be configured directly inside the app's Settings menu.

## Settings Overview

The settings menu provides access to:
- **Audio Quality & Playback**: Adjust streaming and download quality.
- **Appearance**: Toggle themes, language, and other UI aspects.
- **Integrations**: Discord Rich Presence, Last.fm, and ListenBrainz.

*(Note: Certain advanced settings, legacy gradients, and data options are temporarily hidden in this version.)*

## Privacy and Data Handling

PineApple Music operates locally and communicates only with necessary APIs for streaming and lyrics. The app supports local caching and does not upload your personal listening history to unauthorized third-party servers. 

## Support the Developer

If you enjoy using PineApple Music, consider supporting the development!

- **Developer**: Rick Das
- **Email**: rdas.vawsum@gmail.com
- **GitHub**: [RickDas32k](https://github.com/RickDas32k)
- **Support**: Tap "Support Me ❤️" in the app's Settings to pay via UPI (UPI ID: `imrick40@oksbi`).

*(Support QR Code will be added here later)*

## Version Information

**PineApple Music 1.0.1**

## Troubleshooting

- **Gradle Sync Fails**: Ensure you are using the correct JDK version and have an active internet connection.
- **Build Errors**: Try cleaning the project (`./gradlew clean`) and rebuilding.
- **Installation Fails**: Ensure you have uninstalled any conflicting debug/prod variants with the same package name if signatures don't match.

## License

This project is licensed under the **GNU General Public License v3.0 (GPLv3)**.

## Credits and Acknowledgements

NikAmore makes use of various open-source libraries and APIs. Special thanks to the original maintainers, the Compose community, and all contributors to the open-source ecosystem.
