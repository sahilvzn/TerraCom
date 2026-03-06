import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/message.dart';
import '../services/encryption_service.dart';
import 'profile_provider.dart';
import 'mesh_provider.dart';

final chatBoxProvider = Provider<Box<Message>>((ref) => throw UnimplementedError());

class ChatState {
  final Map<String, List<Message>> groupedMessages;
  final List<Message> broadcasts;

  ChatState({required this.groupedMessages, required this.broadcasts});
}

final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) {
  return ChatNotifier(ref);
});

class ChatNotifier extends StateNotifier<ChatState> {
  final Ref ref;

  ChatNotifier(this.ref) : super(ChatState(groupedMessages: {}, broadcasts: [])) {
    _loadMessages();
  }

  void _loadMessages() {
    // To be implemented fully manually if Hive box was populated, but we simplify for app lifecycle
    // Listen to Hive box changes if we used a listener, otherwise hydrate manually.
  }

  void sendMessage(String receiverId, String content, {bool isBroadcast = false}) async {
    final profile = ref.read(profileProvider);
    if (profile == null) return;

    final encryptedContent = EncryptionService.encryptMessage(content);
    
    final msg = Message(
      id: const Uuid().v4(),
      senderId: profile.id,
      receiverId: receiverId,
      content: encryptedContent,
      timestamp: DateTime.now(),
      status: MessageStatus.sent,
      isEncrypted: true,
      hopCount: 0,
    );

    // Persist to UI locally
    _addMessageToState(msg, isBroadcast);

    // Send via Mesh
    // Wrap msg to JSON string
    final payload = jsonEncode(msg.toJson());
    
    if (isBroadcast) {
      ref.read(meshProvider.notifier).broadcastPayload(payload);
    } else {
      // Find the endpoint ID for this receiverId
      // In a real mesh, we would route. For now, simple direct or broadcast.
      ref.read(meshProvider.notifier).broadcastPayload(payload); // Broadcast to all for mesh hopping
    }
  }

  void handleIncomingMessage(String fromEndpoint, String jsonPayload) {
    try {
      final map = jsonDecode(jsonPayload);
      final msg = Message.fromJson(map);

      final myId = ref.read(profileProvider)?.id;

      // Ensure we don't process our own echoed messages
      if (msg.senderId == myId) return;

      bool isBroadcast = msg.receiverId == 'broadcast';
      bool isForMe = msg.receiverId == myId;

      if (isBroadcast || isForMe) {
        _addMessageToState(msg, isBroadcast);
      }

      // ----------------------------------------------------
      // MESH HOPPING (Store and Forward Engine)
      // ----------------------------------------------------
      if (msg.hopCount < 5 && !isForMe) { // max 5 hops to prevent endless loop
        final forwardedMsg = msg.copyWith(hopCount: msg.hopCount + 1);
        ref.read(meshProvider.notifier).broadcastPayload(jsonEncode(forwardedMsg.toJson()));
      }

    } catch (e) {
      // Payload wasn't our message JSON
    }
  }

  void _addMessageToState(Message msg, bool isBroadcast) {
    if (isBroadcast) {
      state = ChatState(
        groupedMessages: state.groupedMessages,
        broadcasts: [...state.broadcasts, msg],
      );
    } else {
      // Group by chat partner
      final partnerId = msg.senderId == ref.read(profileProvider)?.id ? msg.receiverId : msg.senderId;
      final currentList = state.groupedMessages[partnerId] ?? [];
      
      // Avoid dupes
      if (!currentList.any((m) => m.id == msg.id)) {
        final newMap = Map<String, List<Message>>.from(state.groupedMessages);
        newMap[partnerId] = [...currentList, msg];
        
        state = ChatState(
          groupedMessages: newMap,
          broadcasts: state.broadcasts,
        );
      }
    }
  }
}
