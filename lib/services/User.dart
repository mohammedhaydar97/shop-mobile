import 'package:dio/dio.dart';

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
        print('Login successful!');
        print(response.data);
        return true;
      } else {
        print('------------------------------Error: ${response.statusCode}');
        print(response.data);
        return false;
      }
    } catch (err) {
      return false;
      print('--------------------------------Error: $err');
    }
  }
}
