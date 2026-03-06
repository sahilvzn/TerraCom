import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mesh_provider.dart';
import '../models/nearby_device.dart';
import 'private_chat_page.dart';

class NearbyPage extends ConsumerStatefulWidget {
  const NearbyPage({Key? key}) : super(key: key);

  @override
  ConsumerState<NearbyPage> createState() => _NearbyPageState();
}

class _NearbyPageState extends ConsumerState<NearbyPage> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
    
    // Auto-start mesh on load if not discovering
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!ref.read(meshProvider).isDiscovering) {
        ref.read(meshProvider.notifier).startMesh();
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  Color _getSignalColor(int hops) {
    if (hops == 0 || hops == 1) return Colors.greenAccent;
    if (hops == 2) return Colors.orangeAccent;
    return Colors.redAccent;
  }

  @override
  Widget build(BuildContext context) {
    final meshState = ref.watch(meshProvider);
    final allDevices = [...meshState.connectedDevices, ...meshState.discoveredDevices];
    // Remove duplicates keeping connected preferred
    final Map<String, NearbyDevice> uniqueDevices = {};
    for (var d in allDevices) {
      if (!uniqueDevices.containsKey(d.endpointId) || d.status == DeviceStatus.connected) {
        uniqueDevices[d.endpointId] = d;
      }
    }

    final devicesList = uniqueDevices.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Devices', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(meshState.isDiscovering ? Icons.radar : Icons.sensors_off),
            onPressed: () {
              if (meshState.isDiscovering) {
                ref.read(meshProvider.notifier).stopMesh();
              } else {
                ref.read(meshProvider.notifier).startMesh();
              }
            },
          )
        ],
      ),
      body: Column(
        children: [
          if (meshState.isDiscovering)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeTransition(
                    opacity: _pulseController,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(color: Theme.of(context).primaryColor, shape: BoxShape.circle),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text("Scanning for nearby devices...", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          Expanded(
            child: devicesList.isEmpty
                ? const Center(child: Text("No devices found in range."))
                : ListView.builder(
                    itemCount: devicesList.length,
                    itemBuilder: (context, index) {
                      final device = devicesList[index];
                      return ListTile(
                        leading: Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                              child: Text(device.alias.substring(0, 1).toUpperCase()),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: device.status == DeviceStatus.connected ? Colors.green : Colors.grey,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 2),
                                ),
                              ),
                            )
                          ],
                        ),
                        title: Text(device.alias, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Row(
                          children: [
                            Icon(Icons.wifi_tethering, size: 14, color: _getSignalColor(device.hopsAway)),
                            const SizedBox(width: 4),
                            Text('${device.hopsAway} ${device.hopsAway == 1 ? "hop" : "hops"} away'),
                          ],
                        ),
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: device.status == DeviceStatus.connected ? Colors.transparent : Theme.of(context).primaryColor,
                            foregroundColor: device.status == DeviceStatus.connected ? Theme.of(context).primaryColor : Colors.black,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Theme.of(context).primaryColor),
                            )
                          ),
                          onPressed: () {
                            if (device.status != DeviceStatus.connected) {
                              ref.read(meshProvider.notifier).connectToDevice(device.endpointId);
                            }
                            Navigator.push(context, MaterialPageRoute(builder: (_) => PrivateChatPage(partnerId: device.endpointId, partnerName: device.alias)));
                          },
                          child: Text(device.status == DeviceStatus.connected ? 'Message' : 'Connect'),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
