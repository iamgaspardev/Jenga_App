import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Services {
  static const String baseUrl = 'http://bomani.pythonanywhere.com';

  Future<bool> signin(String username, String password) async {
    final url = Uri.parse('$baseUrl/api/sign-in');
    final body = {'username': username, 'password': password};

    try {
      final response = await http.post(
        url,
        body: body,
      );
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          // Parse the JSON response
          final Map<String, dynamic> responseData = json.decode(response.body);
          final String accessToken = responseData['access_token'];
          print("accessToken-------------->");
          print(accessToken);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('access_token', accessToken);

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

  Future<bool> createProject(
    String name,
    String leaderName,
    String supervisor,
    String projectCategory,
    String startDate,
    String endDate,
    String budget,
  ) async {
    final url = Uri.parse('$baseUrl/api/locations');
    final body = {
      'name': name,
      'leader_name': leaderName,
      'supervisor': supervisor,
      'project_category': projectCategory,
      'start_date': startDate,
      'end_date': endDate,
      'budget': budget,
    };

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? '';

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
        body: body,
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future getProject() async {
    final url = Uri.parse('$baseUrl/api/locations');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? '';
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          final Map<String, dynamic> responseData = json.decode(response.body);
          print("object of response data ------>");
          print(responseData['data']);
          return responseData;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
