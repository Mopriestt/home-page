import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:home_page/chatroom/chat_thread_model.dart';
import 'package:http/http.dart' as http;

class MyServer {
  static get _host => 'api.mopriestt.com:${kReleaseMode ? '8443' : '443'}';

  static Future<List<ChatThreadModel>> getChatHistory() async {
    final uri = Uri.https(_host, '/chatroom');
    final response = await http.get(uri);
    return [
      ...(jsonDecode(response.body) as Iterable)
          .map((e) => ChatThreadModel.fromJsonMap(e))
    ];
  }

  static Future<List<ChatThreadModel>> postChat(
    String msg, {
    int? quoteId,
  }) async {
    final uri = Uri.https(_host, '/chatroom');
    final response = await http.post(
      uri,
      body: {'message': msg, if (quoteId != null) 'quote_id': '$quoteId'},
    );
    return [
      ...(jsonDecode(response.body) as Iterable)
          .map((e) => ChatThreadModel.fromJsonMap(e))
    ];
  }

  static Future<void> logConnection(String ip) {
    final uri = Uri.https(_host, '/connection_log');
    return http.post(uri, body: ip);
  }
}
