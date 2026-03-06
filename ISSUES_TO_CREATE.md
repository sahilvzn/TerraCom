# Issues to Create on GitHub

Please create the following issues in your GitHub repository manually to track future development and welcome initial contributors.

---

### 1. Improve Bluetooth mesh reliability on Android
**Description:** Frequent disconnections occur when devices are at the edge of Bluetooth range. We need to implement aggressive retry logic and smoother handovers between WiFi Direct and Bluetooth LE to prevent dropped packets.
**Labels:** `bug`, `help wanted`

### 2. Add iOS nearby_connections support
**Description:** Currently, the app only supports Android. We need to implement a bridge to Apple's MultipeerConnectivity framework (or finalize the nearby_connections iOS bindings) so iPhones can join the mesh.
**Labels:** `enhancement`, `help wanted`

### 3. Add LoRa radio support for long range comms
**Description:** Bluetooth and WiFi Direct are short-range. For true emergency operations, we need a Flutter serial plugin to interface with external ESP32/LoRa modules via Bluetooth or USB-OTG, allowing messages to bounce for miles.
**Labels:** `enhancement`, `help wanted`

### 4. Build offline map showing node positions
**Description:** Implement a local map view (using cached vector tiles) that plots the GPS coordinates of nearby discovered peers and their signal strengths without requiring internet access.
**Labels:** `enhancement`, `help wanted`

### 5. Add voice message support
**Description:** Typing is hard in emergencies. Implement an audio recorder that compresses voice clips into small payloads and chunks them over the mesh network.
**Labels:** `enhancement`

### 6. Improve end-to-end encryption key exchange
**Description:** Implement Elliptic Curve Diffie-Hellman (ECDH) for exchanging symmetric AES keys over the air securely when two peers meet for the first time.
**Labels:** `security`, `enhancement`

### 7. Write unit tests for mesh networking
**Description:** The core routing and gossip protocol logic in `ChatProvider` lacks automated testing. We need robust unit tests to mock node connections and simulate packet drops to ensure the network is self-healing.
**Labels:** `good first issue`, `documentation`

### 8. Add message retry when node reconnects
**Description:** If a message fails to deliver, it should be queued locally. When the target node is discovered again (or a bridging node is found), the message should automatically retry.
**Labels:** `enhancement`

### 9. Build battery optimization mode
**Description:** The Nearby Connections API drains battery by constantly scanning and advertising. Implement a "low power" mode that pulses discovery on and off at set intervals.
**Labels:** `enhancement`, `help wanted`

### 10. Add multiple language support for global use
**Description:** The app is currently English-only. Extract all hardcoded strings and implement `flutter_localizations` supporting Spanish, Arabic, Ukrainian, Russian, and French.
**Labels:** `good first issue`, `help wanted`
