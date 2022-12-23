import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:home_page/api/my_server.dart';
import 'package:home_page/chatroom/input_area.dart';
import 'package:home_page/chatroom/thread_item.dart';

import 'chat_thread_model.dart';

class Chatroom extends StatefulWidget {
  const Chatroom({super.key});

  @override
  State<Chatroom> createState() => _ChatroomState();
}

class _ChatroomState extends State<Chatroom> {
  int? replyingTo;
  var _chats = <ChatThreadModel>[];
  final _scrollController = ScrollController();
  late final Future<List<ChatThreadModel>> fetchChat;

  @override
  void initState() {
    super.initState();
    MyServer.getChatHistory().then((chats) => SchedulerBinding.instance
        .addPostFrameCallback((_) => setState(() => _chats = chats)));
  }

  void onSubmitMessage(String msg, {int? quoteId}) {
    if (msg.trim().isEmpty) return;
    setState(() => _chats.add(ChatThreadModel(
          message: msg,
          quoteId: quoteId,
          isLocal: true,
        )));
    // addPostFrameCallback to make sure new added msg is counted.
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linearToEaseOut,
      );
    });
    MyServer.postChat(msg, quoteId: quoteId)
        .then((chats) => setState(() => _chats = chats));
  }

  void setReplyToThread(int? threadId) => setState(() => replyingTo = threadId);

  Widget _buildChatList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        reverse: true,
        controller: _scrollController,
        itemCount: _chats.length << 1,
        itemBuilder: (_, index) {
          return index & 1 == 0
              ? ThreadItem(
                  (index >> 1) + 1,
                  _chats[index >> 1],
                  replyToThread: () => setReplyToThread((index >> 1) + 1),
                )
              : const Divider(endIndent: 24);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildChatList(context),
            InputArea(
              onSubmitMessage: onSubmitMessage,
              replyingTo: replyingTo,
              clearReplyingTo: () => setReplyToThread(null),
            ),
          ],
        ),
      ),
    );
  }
}
