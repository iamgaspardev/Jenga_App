import 'package:http/http.dart' as http;

class Services {
  static const String baseUrl = 'http://bomani.pythonanywhere.com';

  Future<bool> signin(String username, String password) async {
    final url = Uri.parse('$baseUrl/api/sign-in');
    final body = {'username': username, 'password': password};

    try {
      final response = await http.post(
        url,
        // headers: {'Content-Type': 'application/json'},
        body: body,
      );
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {

          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
