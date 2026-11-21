# PineApple Music - Project Guidelines & Rules

## 1. Automatic Versioning & Changelog Enforcement (MANDATORY)

Whenever any code change, feature addition, bug fix, UI modification, or setting adjustment is made in this project:

1. **Always Increment Version in `build.gradle.kts`**:
   - `extra["nikampVersionCode"]`: Increment by `+1` (integer).
   - `extra["nikampVersionName"]`: Increment the patch or minor version (e.g. `1.0.3` -> `1.0.4`).
   - Note: Do NOT add a leading `"v"` to `nikampVersionName` in `build.gradle.kts` (the in-app updater requires a clean semantic version number).

2. **Always Update `CHANGELOG.md`**:
   - Add a new section for the new version: `## [X.Y.Z] - YYYY-MM-DD`.
   - Categorize all changes using standard Keep a Changelog categories: `### Added`, `### Changed`, `### Deprecated`, `### Removed`, `### Fixed`, `### Security`.
   - Summarize every modification clearly so release notes can be generated directly from it.

3. **Always Update `README.md`**:
   - Keep the version number under `## Version Information` in sync with `nikampVersionName`.

4. **Always Build & Sign Production Release APKs**:
   - When cutting an update or asked to build:
     - Run `./gradlew :app:assembleProdRelease`
     - Sign using `apksigner.bat` with the keystore:
       - Output file: `NikAmp-v<version>_arm64-v8a.apk`
       - Output file: `NikAmp-v<version>.apk`
     - Verify signature integrity using `apksigner.bat verify -v`.

---

## 2. PineApple Music Design & Theme System

- **Brand Accent Color**: PineApple Purple (`#A855F7`), matching the PineApple Music logo. Do not use legacy Spotify green (`#1DB954`).
- **Clean Settings**: Only Google Account / YouTube Music integration is supported. Do not reintroduce removed scrobblers (Spotify, Discord, ListenBrainz, Last.fm) or hidden SMB/WebDAV storage sources unless explicitly requested.
