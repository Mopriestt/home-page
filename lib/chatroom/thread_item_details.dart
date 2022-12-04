import 'package:flutter/material.dart';
import 'package:home_page/api/my_server.dart';
import 'package:home_page/chatroom/input_area.dart';
import 'package:home_page/chatroom/thread_item.dart';

import 'chat_thread_model.dart';

class ThreadItemDetails extends StatefulWidget {
  final ChatThreadModel model;

  const ThreadItemDetails(this.model, {super.key});

  @override
  State<ThreadItemDetails> createState() => _ThreadItemDetailsState();
}

class _ThreadItemDetailsState extends State<ThreadItemDetails> {
  void _reply(String msg) {
    MyServer.postChat(msg, quoteId: widget.model.threadId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ThreadItem(widget.model, showReply: false),
          InputArea(onSubmitMessage: _reply)
        ],
      ),
    );
  }
}