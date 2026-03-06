# TerraComm 📡
### When everything fails, we don't.

TerraComm is an open-source, fully offline emergency mesh chat application. Built for war zones, natural disasters, and survival situations, it weaves nearby devices into a resilient peer-to-peer (P2P) communication network when centralized infrastructure collapses.

## The Problem
Cell towers destroyed. Internet down. SIM useless.
People dying because they can't communicate.

## The Solution
TerraComm turns every smartphone into a mesh node.
Messages hop phone to phone via Bluetooth and WiFi Direct. No internet. No SIM. No servers. Ever.

## Features
- 📶 **100% Offline Connectivity:** Chat directly between devices using Bluetooth and WiFi Direct.
- 🔀 **Multi-Hop Mesh Routing:** Messages chain through intermediate phones to reach their destination.
- 🚨 **Emergency Broadcasts:** Send network-wide SOS alerts with a single tap.
- 🔒 **End-to-End Encryption:** AES-256-GCM secures all communications.
- 💾 **Local Storage:** Wicked-fast NoSQL offline storage with Hive.
- 🌙 **Premium Dark Mode:** Battery-saving, tactical user interface.

## How It Works
TerraComm leverages Google's Nearby Connections API to establish high-bandwidth, decentralized connections between physical devices on the ground. When you broadcast a message, if the recipient is not in immediate range, nearby phones act as repeaters ("nodes")—securely passing the encrypted message along the chain until it reaches the destination.

## Tech Stack
| Category | Technology |
| :--- | :--- |
| **Framework** | Flutter, Dart |
| **Networking** | Nearby Connections (Bluetooth LE / WiFi Direct) |
| **State Management** | Riverpod |
| **Offline Storage** | Hive |
| **Security** | AES-256-GCM (encrypt, pointycastle) |

## Getting Started

```bash
git clone https://github.com/sahilvzn/TerraCom.git
cd TerraCom
flutter pub get
flutter run
```
*Note: Run on 2+ physical Android devices to test hardware mesh networking.*

## Contributing
We welcome developers from all over the world. See `CONTRIBUTING.md` for guidelines on how to submit code, feature requests, or report bugs. 

## Use Cases
- War zones
- Natural disasters
- Earthquake rescue
- Blackouts
- Remote areas

## License
Distributed under the MIT License. See `LICENSE` for more information.

---

### ❤️ A Humanitarian Note
Communication is a fundamental human right. In times of crisis—whether a hurricane, an earthquake, or a deliberate communication blackout—the inability to coordinate can cost lives. By contributing to TerraComm, you are helping build a resilient, indestructible lifeline for humans who need it most. Every line of code could potentially save a life when everything else fails. Let's build a network that can never be turned off.
