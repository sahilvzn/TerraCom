import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../providers/chat_provider.dart';
import '../models/message.dart';
import 'private_chat_page.dart';

class ChatsListPage extends ConsumerWidget {
  const ChatsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(chatProvider);
    final groupedChats = chatState.groupedMessages.entries.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: groupedChats.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat_bubble_outline, size: 64, color: Theme.of(context).dividerColor),
                  const SizedBox(height: 16),
                  Text(
                    'No active chats yet.\nFind someone nearby to start connecting!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color),
                  ),
                ],
              ),
            )
          : ListView.separated(
              itemCount: groupedChats.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final targetId = groupedChats[index].key;
                final messages = groupedChats[index].value;
                final lastMsg = messages.last;

                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
                    child: Text(targetId.substring(0, 2).toUpperCase(), style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                  ),
                  title: Text(targetId.substring(0, 8), style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text(
                    lastMsg.content, // Normally would decrypt here if needed for preview
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(timeago.format(lastMsg.timestamp, locale: 'en_short')),
                      const SizedBox(height: 4),
                      if (lastMsg.status == MessageStatus.read)
                        const Icon(Icons.done_all, size: 16, color: Colors.blue)
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (_) => PrivateChatPage(
                          partnerId: targetId,
                          partnerName: targetId.substring(0, 8),
                        )
                      )
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Nearby
        },
        child: const Icon(Icons.maps_ugc_rounded),
      ),
    );
  }
}
