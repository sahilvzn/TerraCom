import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mesh_provider.dart';
import '../providers/profile_provider.dart';

class MeshStatusPage extends ConsumerWidget {
  const MeshStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meshState = ref.watch(meshProvider);
    final profile = ref.watch(profileProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mesh Status', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Graphic showing node
          Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                border: Border.all(color: Theme.of(context).primaryColor, width: 2),
              ),
              child: Column(
                children: [
                  Icon(Icons.hub_rounded, size: 48, color: Theme.of(context).primaryColor),
                  const SizedBox(height: 8),
                  Text("You", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                  Text(profile?.name ?? "Unknown", style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 32),
          
          _StatCard(
            title: "Network Health",
            value: meshState.connectedDevices.isNotEmpty ? "Good" : "Disconnected",
            icon: Icons.monitor_heart_rounded,
            color: meshState.connectedDevices.isNotEmpty ? Colors.green : Colors.grey,
          ),
          const SizedBox(height: 12),
          _StatCard(
            title: "Active Connections",
            value: "${meshState.connectedDevices.length} Nodes",
            icon: Icons.link_rounded,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(height: 12),
          _StatCard(
            title: "Nearby Visible Nodes",
            value: "${meshState.discoveredDevices.length} Nodes",
            icon: Icons.visibility_rounded,
            color: Colors.blueAccent,
          ),
          
          const SizedBox(height: 32),
          const Text("Network Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          
          Card(
            color: Theme.of(context).colorScheme.surface,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.bluetooth),
                  title: const Text("Bluetooth LE"),
                  trailing: Text(meshState.isAdvertising ? "Active" : "Inactive", style: const TextStyle(color: Colors.green)),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.wifi),
                  title: const Text("WiFi Direct"),
                  trailing: Text(meshState.isAdvertising ? "Active" : "Inactive", style: const TextStyle(color: Colors.green)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({required this.title, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color)),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}
