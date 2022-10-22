import 'dart:convert';

import 'package:http/http.dart' as http;

class MyServer {
  static const _host  = '159.196.212.234:924';

  static Future<List<String>> getChatHistory() async {
    final uri = Uri.http(_host, '/chatroom');
    final response = await http.get(uri);
    return <String>[...jsonDecode(response.body) as List];
  }

  static Future<List<String>> postChat(String msg) async {
    final uri = Uri.http(_host, '/chatroom');
    final response = await http.post(uri, body: msg);
    return <String>[...jsonDecode(response.body) as List];
  }
}