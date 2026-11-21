# Changelog

All notable changes to the **PineApple Music** project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.3] - 2026-11-21

### Added
- **One-Tap Google Sign-In**: Integrated native Android Google Account picker dialog (`GoogleSignInClient` / `DEFAULT_SIGN_IN`), allowing users to instantly select an existing Google account from their device without manual password entry.
- **YouTube Music Library & Profile Sync**: Automatic fetching of user profile photo, display name, channel switcher, and complete library synchronization (saved songs, albums, and playlists).
- **Spotify-Inspired Home Screen**:
  - Contextual time-based greeting header (*"Good morning"*, *"Good afternoon"*, *"Good evening"*).
  - Quick-access recents/favorites grid with direct one-tap playback.
  - Real-time animated playing waveform indicators on active tracks.
  - Curated recommendation shelves with horizontal scrolling and hero cards.
  - Interactive category filter chips (*All*, *Music*, *Podcasts*).

### Changed
- **PineApple Music Brand Color Accent**: Replaced all green accent colors (`#1DB954`) with vibrant **PineApple Purple** (`#A855F7`), matching the official PineApple Music logo across filter chips, floating play badges, waveforms, and header links.
- **Streamlined Account & Integrations**: Cleaned up the settings interface by removing Spotify, Discord Rich Presence, ListenBrainz, and Last.fm integrations. The screen now exclusively focuses on Google Account authentication, channel management, and sign-out.
- **Simplified Storage Sources**: Hidden WebDAV and SMB options under Settings > Sources to reduce complexity.
- **Version Bump**: Incremented `nikampVersionCode` to `32` and `nikampVersionName` to `1.0.3` across all application modules.

---

## [1.0.2] - 2026-11-20

### Added
- Initial implementation of the Spotify-style home feed and hero carousel.
- YouTube Music Google Account authentication infrastructure.

### Changed
- Refactored media session and audio pipeline for lower latency playback.

---

## [1.0.1] - 2026-11-16

### Added
- PineApple Music branding and application icon.
- Offline downloads management and playback improvements.

### Fixed
- Fixed audio equalizer state persistence across app restarts.

---

## [1.0.0] - 2026-10-28

### Added
- Initial release of PineApple Music client for Android and Android TV.
- Stream music from YouTube Music without ads.
- Time-synced lyrics with Romanized pronunciation support.
- Local audio playback and caching.
