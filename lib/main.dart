import 'package:flutter/material.dart';
import 'package:home_page/chatroom/chatroom.dart';

import 'home_page.dart';

void main() {
  runApp(
    MaterialApp(
//      home: const HomePage(),
      routes: {
        '/': (_) => const HomePage(),
        'chatroom': (_) => Chatroom(),
      },
    ),
  );
}
