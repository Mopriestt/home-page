import 'package:test/test.dart';
import 'package:home_page/api/my_server.dart';

void main() {
  test('test get chat history', () async {
    final responseBody = await MyServer.getChatHistory();
    print(responseBody);
  });
}
