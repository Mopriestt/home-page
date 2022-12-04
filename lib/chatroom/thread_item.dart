import 'package:flutter/material.dart';
import 'package:home_page/chatroom/chat_thread_model.dart';
import 'package:home_page/chatroom/thread_item_details.dart';

class ThreadItem extends StatefulWidget {
  final ChatThreadModel model;
  final bool showReply;

  const ThreadItem(this.model, {this.showReply = true, super.key});

  @override
  State<StatefulWidget> createState() => _ThreadItemState();
}

class _ThreadItemState extends State<ThreadItem> {
  void _openThreadDetails() {
    //showDialog(context: context, builder: (_) => ThreadItemDetails(widget.model));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(widget.model.message),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              widget.model.postTime ?? 'error',
              style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 12,
              ),
            ),
            if (widget.showReply) IconButton(
              onPressed: _openThreadDetails,
              icon: const Icon(
                Icons.reply,
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
