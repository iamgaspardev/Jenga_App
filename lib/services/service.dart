import 'dart:convert';
import 'package:http/http.dart' as http;

class Services {
  static const String baseUrl = 'http://bomani.pythonanywhere.com';

  Future<bool> signin(String username, String password) async {
    final url = Uri.parse('$baseUrl/sign-in');
    final body = jsonEncode({'username': username, 'password': password});

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error during login: $e');
      return false;
    }
  }
}
