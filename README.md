```text
  _______                   _____                     
 |__   __|                 / ____|                    
    | | ___ _ __ _ __ __ _| |     ___  _ __ ___  _ __ 
    | |/ _ \ '__| '__/ _` | |    / _ \| '_ ` _ \| '_ \
    | |  __/ |  | | | (_| | |___| (_) | | | | | | | | |
    |_|\___|_|  |_|  \__,_|\_____\___/|_| |_| |_|_| |_|
```
<div align="center">
  <h3>"When everything fails, we don't"</h3>
</div>

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Open%20Source-Yes-brightgreen?style=for-the-badge" />
</div>

<br>

**TerraComm** is a fully offline emergency mesh chat application built for war zones, natural disasters, and survival situations. 

When cell towers go down, the internet dies, and SIM cards stop working, this application continues to operate by utilizing Bluetooth Low Energy and WiFi Direct to weave nearby smartphones into a decentralized, self-healing peer-to-peer (P2P) network.

---

### ✨ Features
- 📶 **100% Offline Connectivity:** Chat directly between devices using Bluetooth and WiFi Direct.
- 🔀 **Multi-Hop Mesh Routing:** Messages chain through intermediate phones to reach their destination.
- 🚨 **Emergency Broadcasts:** Send network-wide SOS alerts with a single tap.
- 🔒 **End-to-End Encryption:** AES-256-GCM secures all communications.
- 💾 **Local Storage:** Wicked-fast NoSQL offline storage with Hive.
- 🌙 **Premium Dark Mode:** Battery-saving, tactical user interface.
- 🔋 **Battery Optimization Mode:** Coming soon!
- 🗺️ **Offline Map View:** Coming soon!
- 🎙️ **Voice Messages:** Coming soon!

### 🛠️ Tech Stack
| Category | Technology |
| :--- | :--- |
| **Framework** | [Flutter](https://flutter.dev/) |
| **Language** | [Dart](https://dart.dev/) |
| **State Management** | [Riverpod](https://riverpod.dev/) |
| **Local Database** | [Hive](https://docs.hivedb.dev/) |
| **Mesh Networking** | [Google Nearby Connections](https://developers.google.com/nearby/connections/overview) |
| **Code Generation** | Freezed, build_runner |

### 🚀 How to Run Locally

1. **Clone the repository:**
   ```bash
   git clone https://github.com/sahilvzn/TerraCom.git
   cd TerraCom/powersync-supabase-flutter-simple-chat-demo-template
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Generate code (Required):**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app (Requires a physical Android device):**
   ```bash
   flutter run
   ```

> **Note:** Mesh networking does not work effectively on simulators/emulators. Use 2+ physical Android devices to test connectivity.

### 🤝 How to Contribute
Check out out [CONTRIBUTING.md](./CONTRIBUTING.md) guide for detailed instructions on how to set up, fork, and submit a Pull Request. We need iOS support, LoRa integration, and lots of tests!

### 📸 Screenshots
*(Screenshots coming soon!)*

### 📜 License
Distributed under the MIT License. See `LICENSE` for more information.

---

### ❤️ A Humanitarian Note
Communication is a fundamental human right. In times of crisis—whether a hurricane, an earthquake, or a deliberate communication blackout—the inability to coordinate can cost lives. By contributing to TerraComm, you are helping build a resilient, indestructible lifeline for humans who need it most. Every pull request, bug fix, and feature you add could potentially save a life when everything else fails.

**Let's build a network that can never be turned off.**
