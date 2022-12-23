import 'package:flutter/material.dart';
import 'package:home_page/chatroom/chat_thread_model.dart';

class ThreadItem extends StatefulWidget {
  final ChatThreadModel model;
  final int index;
  final Function() replyToThread;

  const ThreadItem(this.index, this.model,
      {required this.replyToThread, super.key});

  @override
  State<StatefulWidget> createState() => _ThreadItemState();
}

class _ThreadItemState extends State<ThreadItem> {
  String get replyingToText {
    if (widget.model.quoteId == null) return '';
    return ' --> #${widget.model.quoteId}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          '#${widget.index}$replyingToText',
          style: const TextStyle(
            color: Colors.blueAccent,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        SelectableText(widget.model.message),
        Row(
          children: [
            SelectableText(
              widget.model.postTime ?? 'error',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            IconButton(
              onPressed: widget.replyToThread,
              icon: const Icon(
                Icons.reply_outlined,
                color: Colors.blueAccent,
              ),
              splashRadius: 16,
            ),
          ],
        ),
      ],
    );
  }
}
