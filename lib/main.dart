import 'package:flutter/material.dart';
import 'package:home_page/chatroom/chatroom.dart';

import 'home_page.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/': (_) => const HomePage(),
        'chatroom': (_) => const Chatroom(),
      },
    ),
  );
}
