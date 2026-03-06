import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../providers/chat_provider.dart';
import '../services/encryption_service.dart';

class BroadcastPage extends ConsumerWidget {
  const BroadcastPage({Key? key}) : super(key: key);

  void _sendBroadcast(WidgetRef ref, String text) {
    ref.read(chatProvider.notifier).sendMessage('broadcast', text, isBroadcast: true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(chatProvider);
    final broadcasts = chatState.broadcasts.reversed.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.cell_tower_rounded, color: Colors.redAccent),
            SizedBox(width: 8),
            Text('Emergency Broadcast', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent)),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.redAccent.withValues(alpha: 0.1),
            child: const Text(
              "Messages sent here will be broadcasted to every connected device in the mesh network. Anyone nearby will immediately receive it.",
              style: TextStyle(color: Colors.redAccent, fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
          
          Expanded(
            child: broadcasts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.notifications_off_outlined, size: 64, color: Theme.of(context).dividerColor),
                        const SizedBox(height: 16),
                        Text(
                          'No broadcasts received.',
                          style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: broadcasts.length,
                    itemBuilder: (context, index) {
                      final msg = broadcasts[index];
                      String displayTxt = msg.content;
                      if (msg.isEncrypted) {
                        displayTxt = EncryptionService.decryptMessage(msg.content);
                      }
                      
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        color: Theme.of(context).colorScheme.surface,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.redAccent.withValues(alpha: 0.5)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.warning_amber_rounded, color: Colors.redAccent, size: 20),
                                      const SizedBox(width: 8),
                                      Text(
                                        "From: ${msg.senderId.substring(0, 8)}", 
                                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent)
                                      ),
                                    ],
                                  ),
                                  Text(
                                    timeago.format(msg.timestamp, locale: 'en_short'),
                                    style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color, fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(displayTxt, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.surface,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Quick Emergency Templates:", style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _QuickAction(icon: "🆘", label: "Help", onTap: () => _sendBroadcast(ref, "🆘 NEED URGENT HELP — Share my location")),
                      _QuickAction(icon: "🏥", label: "Medical", onTap: () => _sendBroadcast(ref, "🏥 MEDICAL EMERGENCY — Need assistance now")),
                      _QuickAction(icon: "✅", label: "Safe", onTap: () => _sendBroadcast(ref, "✅ I AM SAFE — All clear at my location")),
                      _QuickAction(icon: "🚨", label: "Danger", onTap: () => _sendBroadcast(ref, "🚨 DANGER — Avoid this area")),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const _QuickAction({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Text(icon, style: const TextStyle(fontSize: 16)),
      label: Text(label),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      side: BorderSide(color: Theme.of(context).primaryColor.withValues(alpha: 0.3)),
      onPressed: onTap,
    );
  }
}
