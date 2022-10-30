import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class MyServer {
  static get _host => '159.196.212.234:${kDebugMode ? '1993' : '924'}';

  static Future<List<String>> getChatHistory() async {
    final uri = Uri.http(_host, '/chatroom');
    final response = await http.get(uri);
    return [
      ...(jsonDecode(response.body) as Iterable)
          .map((e) => (e as Map)['message']!)
    ];
  }

  static Future<List<String>> postChat(String msg, {int? quoteId}) async {
    final uri = Uri.http(_host, '/chatroom');
    final response = await http.post(uri,
        body: {'message': msg, if (quoteId != null) 'quote_id': '$quoteId'});
    return [
      ...(jsonDecode(response.body) as Iterable)
          .map((e) => (e as Map)['message']!)
    ];
  }
}
