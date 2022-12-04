import 'package:home_page/api/my_server.dart';
import 'package:http/http.dart' as http;

class ConnectionLogService {
  static Future<void> logIp() async {
    try {
      final uri = Uri.https('api.ipify.org');
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        await MyServer.logConnection(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (exception) {
      print(exception);
    }
  }
}