import 'package:flutter/material.dart';

class Chatroom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatroomState();
}

class _ChatroomState extends State<Chatroom> {
  final _chats = <String>[];
  final _controller = TextEditingController();

  Widget _buildInputArea() {
    return Row(
      children: [
        Expanded(
            child: TextField(
          controller: _controller,
          style: const TextStyle(fontSize: 36),
        )),
        IconButton(
          onPressed: () => setState(() => _chats.add(_controller.text)),
          icon: const Icon(Icons.subdirectory_arrow_left),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.builder(
            itemCount: _chats.length * 2 + 1,
            itemBuilder: (_, index) {
              if (index == 0) return _buildInputArea();
              return index & 1 == 1
                  ? Text(_chats[index - 1 >> 1],
                      style: const TextStyle(fontSize: 36))
                  : const Divider();
            }),
      ),
    );
  }
}
