import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserApis {
  Future<bool> loginUsingEmail(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.106:8000/api/users/login'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        String token = jsonData['token'];
        await saveToken(token);
        print('Login successful!');
        print(jsonData);
        return true;
      } else {
        print('------------------------------Error: ${response.statusCode}');
        print(response.body);
        return false;
      }
    } catch (err) {
      print('--------------------------------Error: $err');
      return false;
    }
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt_token', token);
    print('Token saved: $token');
  }
}
