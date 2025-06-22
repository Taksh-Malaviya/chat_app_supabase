import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatController extends GetxController {
  final SupabaseClient client = Supabase.instance.client;

  final RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[].obs;
  final TextEditingController messageTextController = TextEditingController();

  late String currentUserId;
  late String otherUserId;
  late String otherUserName;
  late String? otherUserPhoto;

  StreamSubscription<List<Map<String, dynamic>>>? messageStream;

  @override
  void onInit() {
    super.onInit();

    final user = client.auth.currentUser;
    if (user == null) {
      Get.snackbar("Error", "User not logged in");
      return;
    }

    currentUserId = user.id;

    final args = Get.arguments as Map<String, dynamic>;
    otherUserId = args['id'];
    otherUserName = args['full_name'] ?? 'Unknown';
    otherUserPhoto = args['profile_url'];
    fetchMessages();
    subscribeToMessages();
  }

  Future<void> fetchMessages() async {
    final data = await client
        .from('messages')
        .select()
        .or(
          'and(sender_id.eq.$currentUserId,receiver_id.eq.$otherUserId),' +
              'and(sender_id.eq.$otherUserId,receiver_id.eq.$currentUserId)',
        )
        .order('created_at');

    data.sort(
      (a, b) => DateTime.parse(
        a['created_at'],
      ).compareTo(DateTime.parse(b['created_at'])),
    );

    messages.assignAll(data);
  }

  Future<void> sendMessage() async {
    final content = messageTextController.text.trim();
    if (content.isEmpty) return;

    await client.from('messages').insert({
      'sender_id': currentUserId,
      'receiver_id': otherUserId,
      'content': content,
    });

    messageTextController.clear();
  }

  void subscribeToMessages() {
    final stream = client
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map(
          (allMessages) =>
              allMessages.where((msg) {
                final sender = msg['sender_id'];
                final receiver = msg['receiver_id'];
                return (sender == currentUserId && receiver == otherUserId) ||
                    (sender == otherUserId && receiver == currentUserId);
              }).toList(),
        );

    messageStream?.cancel();
    messageStream = stream.listen((newMessages) {
      messages.assignAll(newMessages);
    });
  }

  @override
  void onClose() {
    messageStream?.cancel();
    messageTextController.dispose();
    super.onClose();
  }
}
