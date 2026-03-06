import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/chat_provider.dart';
import '../services/encryption_service.dart';

class PrivateChatPage extends ConsumerStatefulWidget {
  final String partnerId;
  final String partnerName;

  const PrivateChatPage({Key? key, required this.partnerId, required this.partnerName}) : super(key: key);

  @override
  ConsumerState<PrivateChatPage> createState() => _PrivateChatPageState();
}

class _PrivateChatPageState extends ConsumerState<PrivateChatPage> {
  final _msgController = TextEditingController();

  void _send() {
    final text = _msgController.text.trim();
    if (text.isEmpty) return;
    _msgController.clear();

    ref.read(chatProvider.notifier).sendMessage(widget.partnerId, text);
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider);
    final messages = chatState.groupedMessages[widget.partnerId] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
              child: Text(widget.partnerName.substring(0, 1).toUpperCase(), style: const TextStyle(fontSize: 14)),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.partnerName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Direct Connection", style: TextStyle(fontSize: 12, color: Theme.of(context).primaryColor)),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // Show newest at bottom (requires reversed list or insertion handling)
              itemCount: messages.length,
              itemBuilder: (context, index) {
                // Reverse index since latest are pushed at the end
                final msg = messages[messages.length - 1 - index];
                
                // Decrypt message visually here
                String displayTxt = msg.content;
                if (msg.isEncrypted) {
                  displayTxt = EncryptionService.decryptMessage(msg.content);
                }

                bool isMine = msg.receiverId == widget.partnerId;

                return Align(
                  alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isMine ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: Radius.circular(isMine ? 16 : 4),
                        bottomRight: Radius.circular(isMine ? 4 : 16),
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(displayTxt, style: TextStyle(color: isMine ? Colors.black : Colors.white)),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (msg.isEncrypted) Icon(Icons.lock, size: 10, color: isMine ? Colors.black54 : Colors.white54),
                            const SizedBox(width: 4),
                            Text(
                              "${msg.timestamp.hour}:${msg.timestamp.minute.toString().padLeft(2, '0')}", 
                              style: TextStyle(fontSize: 10, color: isMine ? Colors.black54 : Colors.white54)
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _msgController,
                      decoration: InputDecoration(
                        hintText: 'Message',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.surface,
                      ),
                      onSubmitted: (_) => _send(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.black),
                      onPressed: _send,
                    ),
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
