import 'package:flutter/material.dart';
import 'package:home_page/api/connection_log_service.dart';
import 'package:home_page/chatroom/chatroom.dart';

import 'home_page.dart';

final myApp = MaterialApp(
  routes: {
    '/': (_) => const HomePage(),
    'chatroom': (_) => const Chatroom(),
  },
);


void main() {
  ConnectionLogService.logIp();
  runApp(myApp);
}