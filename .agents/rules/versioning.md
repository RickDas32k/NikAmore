---
trigger: always_on
description: Always increment version numbers and update CHANGELOG.md whenever making changes.
---

# Automatic Versioning & Changelog Rule

Whenever any change is made to this repository:
1. Always increment `nikampVersionCode` (by +1) and `nikampVersionName` in `build.gradle.kts`.
2. Always add a corresponding entry in `CHANGELOG.md` with date and bullet points under `Added`, `Changed`, `Fixed`, or `Removed`.
3. Always update `README.md` version info.
4. When releasing, build and sign the release APKs named `NikAmp-v<version>_arm64-v8a.apk` and `NikAmp-v<version>.apk`.
