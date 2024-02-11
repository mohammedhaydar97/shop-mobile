import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApis {
  final Dio _dio = Dio();

  Future<bool> loginUsingEmail(String email, String password) async {
    try {
      final response = await _dio.post(
        'http://192.168.1.106:8000/api/users/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        String token = response.data['token'];
        await saveToken(token);
        print('Login successful!');
        print(response.data);
        return true;
      } else {
        print('------------------------------Error: ${response.statusCode}');
        print(response.data);
        return false;
      }
    } catch (err) {
      print('--------------------------------Error: $err');
      return false;
    }
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenString = await prefs.setString('jwt_token', token);
    print('--------------------------------------------$tokenString');
  }
}
