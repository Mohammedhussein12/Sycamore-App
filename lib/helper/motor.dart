import 'package:http/http.dart' as http;

final String baseUrl = 'http://192.168.43.217/sendData';
void sendDataToNodeMCU(String data) async {
  try {
    var response = await http.post(
      Uri.parse(baseUrl),
      body: {'data': data},
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  } catch (e) {
    print('Error sending data: $e');
  }
}