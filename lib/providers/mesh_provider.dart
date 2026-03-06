import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearby_connections/nearby_connections.dart';
import '../models/nearby_device.dart';
import 'profile_provider.dart';

// State definition for the Mesh engine
class MeshState {
  final bool isAdvertising;
  final bool isDiscovering;
  final List<NearbyDevice> discoveredDevices;
  final List<NearbyDevice> connectedDevices;

  MeshState({
    required this.isAdvertising,
    required this.isDiscovering,
    required this.discoveredDevices,
    required this.connectedDevices,
  });

  MeshState copyWith({
    bool? isAdvertising,
    bool? isDiscovering,
    List<NearbyDevice>? discoveredDevices,
    List<NearbyDevice>? connectedDevices,
  }) {
    return MeshState(
      isAdvertising: isAdvertising ?? this.isAdvertising,
      isDiscovering: isDiscovering ?? this.isDiscovering,
      discoveredDevices: discoveredDevices ?? this.discoveredDevices,
      connectedDevices: connectedDevices ?? this.connectedDevices,
    );
  }
}

final meshProvider = StateNotifierProvider<MeshNotifier, MeshState>((ref) {
  return MeshNotifier(ref);
});

class MeshNotifier extends StateNotifier<MeshState> {
  final Ref ref;
  final Strategy strategy = Strategy.P2P_CLUSTER; // Supports M-N topology

  MeshNotifier(this.ref)
      : super(MeshState(
          isAdvertising: false,
          isDiscovering: false,
          discoveredDevices: [],
          connectedDevices: [],
        ));

  String get _localDeviceName {
    final profile = ref.read(profileProvider);
    // Transmit Alias and ID so peers know who we are
    if (profile != null) {
      return '${profile.name}|${profile.id}';
    }
    return 'Unknown Device';
  }

  Future<void> startMesh() async {
    await _startAdvertising();
    await _startDiscovery();
  }

  Future<void> stopMesh() async {
    await Nearby().stopAdvertising();
    await Nearby().stopDiscovery();
    await Nearby().stopAllEndpoints();
    state = state.copyWith(
      isAdvertising: false,
      isDiscovering: false,
      discoveredDevices: [],
      connectedDevices: [],
    );
  }

  Future<void> _startAdvertising() async {
    try {
      bool a = await Nearby().startAdvertising(
        _localDeviceName,
        strategy,
        onConnectionInitiated: _onConnectionInit,
        onConnectionResult: (id, status) {
          if (status == Status.CONNECTED) {
            _handleSuccessfulConnection(id);
          }
        },
        onDisconnected: _onDisconnected,
      );
      state = state.copyWith(isAdvertising: a);
    } catch (e) {
      // Handle err
    }
  }

  Future<void> _startDiscovery() async {
    try {
      bool d = await Nearby().startDiscovery(
        _localDeviceName,
        strategy,
        onEndpointFound: (id, name, serviceId) {
          final parts = name.split('|');
          final alias = parts.isNotEmpty ? parts[0] : 'Unknown';
          
          final device = NearbyDevice(
            endpointId: id,
            deviceName: name,
            alias: alias,
            signalStrength: 3, // Mocked signal strength
            status: DeviceStatus.discovered,
          );

          if (!state.discoveredDevices.any((d) => d.endpointId == id)) {
            state = state.copyWith(
              discoveredDevices: [...state.discoveredDevices, device],
            );
          }
        },
        onEndpointLost: (id) {
          state = state.copyWith(
            discoveredDevices: state.discoveredDevices.where((d) => d.endpointId != id).toList(),
          );
        },
      );
      state = state.copyWith(isDiscovering: d);
    } catch (e) {
      // Handle err
    }
  }

  Future<void> connectToDevice(String endpointId) async {
    try {
      await Nearby().requestConnection(
        _localDeviceName,
        endpointId,
        onConnectionInitiated: _onConnectionInit,
        onConnectionResult: (id, status) {
          if (status == Status.CONNECTED) {
            _handleSuccessfulConnection(id);
          }
        },
        onDisconnected: _onDisconnected,
      );
    } catch (e) {
      // Handle Err
    }
  }

  void _onConnectionInit(String id, ConnectionInfo info) async {
    // Auto-accept all incoming mesh connections for seamless emergency netting
    await Nearby().acceptConnection(
      id,
      onPayLoadRecieved: (endpointId, payload) {
        if (payload.type == PayloadType.BYTES) {
          final _ = String.fromCharCodes(payload.bytes!);
          // Pass this to ChatProvider
          // ref.read(chatProvider.notifier).handleIncomingMessage(endpointId, str);
        }
      },
      onPayloadTransferUpdate: (endpointId, payloadTransferUpdate) {},
    );
  }

  void _handleSuccessfulConnection(String id) {
    // Move from discovered to connected if applicable
    final dev = state.discoveredDevices.firstWhere(
      (d) => d.endpointId == id, 
      orElse: () => NearbyDevice(
        endpointId: id, 
        deviceName: 'Peer', 
        alias: 'Peer', 
        status: DeviceStatus.connected
      )
    );

    final connectedDev = dev.copyWith(status: DeviceStatus.connected);

    final updatedDiscovered = state.discoveredDevices.where((d) => d.endpointId != id).toList();
    final updatedConnected = [...state.connectedDevices, connectedDev];

    state = state.copyWith(
      discoveredDevices: updatedDiscovered,
      connectedDevices: updatedConnected,
    );
  }

  void _onDisconnected(String id) {
    state = state.copyWith(
      connectedDevices: state.connectedDevices.where((d) => d.endpointId != id).toList(),
    );
  }

  void broadcastPayload(String payloadStr) {
    final bytes = utf8.encode(payloadStr);
    for (var device in state.connectedDevices) {
      Nearby().sendBytesPayload(device.endpointId, bytes);
    }
  }

  void sendDirectPayload(String endpointId, String payloadStr) {
    final bytes = utf8.encode(payloadStr);
    Nearby().sendBytesPayload(endpointId, bytes);
  }
}
