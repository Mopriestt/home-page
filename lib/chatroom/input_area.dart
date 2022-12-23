import 'package:flutter/material.dart';

/// Widget for chat composing and post.
class InputArea extends StatefulWidget {
  final int? replyingTo;
  final Function(String, {int? quoteId}) onSubmitMessage;
  final Function() clearReplyingTo;

  const InputArea({
    super.key,
    required this.onSubmitMessage,
    required this.clearReplyingTo,
    this.replyingTo,
  });

  @override
  State<StatefulWidget> createState() => _InputAreaState();
}

class _InputAreaState extends State<InputArea> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  void postMsg() {
    widget.onSubmitMessage(_controller.text, quoteId: widget.replyingTo);
    setState(() => _controller.text = '');
    _focusNode.requestFocus();
    widget.clearReplyingTo();
  }

  Widget _buildReplyingChip() {
    return Chip(
      label: Text('Reply to #${widget.replyingTo}'),
      onDeleted: widget.clearReplyingTo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return
        Row(
          children: [
            if (widget.replyingTo != null) _buildReplyingChip(),
            Expanded(
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                style: const TextStyle(fontSize: 36),
                onSubmitted: (_) => postMsg(), // Keyboard enter.
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              onPressed: postMsg,
              icon: const Icon(Icons.subdirectory_arrow_left),
            )
          ],
        );
  }
}
