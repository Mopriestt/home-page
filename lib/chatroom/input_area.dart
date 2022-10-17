import 'package:flutter/material.dart';

/// Widget for chat composing and post.
class InputArea extends StatefulWidget {
  final Function(String msg) onSubmitMessage;

  const InputArea({super.key, required this.onSubmitMessage});

  @override
  State<StatefulWidget> createState() => _InputAreaState();
}

class _InputAreaState extends State<InputArea> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  void postMsg() {
    widget.onSubmitMessage(_controller.text);
    setState(() => _controller.text = '');
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            style: const TextStyle(fontSize: 36),
            onSubmitted: (_) => postMsg(), // Keyboard enter.
          ),
        ),
        IconButton(
          onPressed: postMsg,
          icon: const Icon(Icons.subdirectory_arrow_left),
        )
      ],
    );
  }
}