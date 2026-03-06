# Contributing to TerraComm

Welcome! Thank you for considering contributing to TerraComm. We are building technology for humanitarian crises, war zones, and survival situations. 

**Code of Conduct:** Please be respectful. This is humanitarian tech. We expect all contributors to maintain a professional, compassionate, and collaborative environment.

## Getting Started

### 1. Fork and Clone
1. Fork the repository on GitHub.
2. Clone your fork locally:
   ```bash
   git clone https://github.com/YOUR-USERNAME/TerraCom.git
   cd TerraCom/powersync-supabase-flutter-simple-chat-demo-template
   ```

### 2. Set Up Locally
You need the Flutter SDK and a physical Android device to test mesh networking.

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

## Project Structure (`lib/`)
- `models/`: Domain entities mapped with Freezed.
- `providers/`: Riverpod state management (e.g., `MeshProvider`, `ChatProvider`).
- `services/`: Independent services like `EncryptionService` and `StorageService` (Hive).
- `pages/`: UI screens.
- `utils/`: Theme data, constants, and helpers.

## Coding Standards
- **State Management:** Use `Riverpod`.
- **Immutable Models:** Use `freezed`.
- **Clean Architecture:** Keep business logic in providers and UI purely declarative.
- **Flutter Best Practices:** Avoid tight coupling, run `flutter analyze` before committing.

## How to Submit a Pull Request
1. Create a new branch: `git checkout -b feature/your-feature-name`
2. Make your amazing changes.
3. Run `flutter analyze` and fix any warnings.
4. Commit your changes: `git commit -m "feat: adding amazing feature"`
5. Push to your fork: `git push origin feature/your-feature-name`
6. Open a Pull Request against the `main` branch.

## Areas That Need Help Most (We Need You!)
* **Bluetooth Mesh Reliability:** Improving Android reconnects and connection dropping.
* **iOS nearby_connections Support:** Bridging MultipeerConnectivity with Nearby.
* **LoRa Radio Integration:** Writing a plugin for serial comms with LoRa modules.
* **Offline Map View:** Plotting node coordinates without internet tile servers.
* **UI Improvements:** Refining the dark mode aesthetic.
* **Writing Tests:** Unit tests for MeshProvider and routing logic.
* **Documentation:** Better inline comments and architecture specs.

## Reporting Bugs
If you find a bug, please create a GitHub Issue. Include:
1. Steps to reproduce
2. Device model and OS version
3. Expected vs Actual behavior

## Contact
Maintainer: [sahilvzn](https://github.com/sahilvzn)

Thank you for helping us build communication resilience!
