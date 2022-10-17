import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:home_page/chatroom/input_area.dart';

class Chatroom extends StatefulWidget {
  const Chatroom({super.key});

  @override
  State<StatefulWidget> createState() => _ChatroomState();
}

class _ChatroomState extends State<Chatroom> {
  final _chats = <String>[];
  final _scrollController = ScrollController();

  void onSubmitMessage(String msg) {
    if (msg.trim().isEmpty) return;
    setState(() => _chats.add(msg));
    // addPostFrameCallback to make sure new added msg is counted.
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linearToEaseOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Image.asset(
              'assets/gif/shake.gif',
              height: 125.0,
              width: 125.0,
            ),
            Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _chats.length * 2,
                  itemBuilder: (_, index) {
                    return index & 1 == 0
                        ? Text(_chats[index >> 1],
                            style: const TextStyle(fontSize: 36))
                        : const Divider(endIndent: 24);
                  }),
            ),
            InputArea(onSubmitMessage: onSubmitMessage),
          ],
        ),
      ),
    );
  }
}
