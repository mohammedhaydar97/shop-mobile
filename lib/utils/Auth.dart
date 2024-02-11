import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopmobile/screens/LoginScreen.dart';
import 'package:shopmobile/screens/MainScreen.dart';

class Auth {
  static Future<void> navigateBasedOnToken(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('jwt_token');

    if (jwtToken != null) {
      // Check if already on MainScreen
      if (!(ModalRoute.of(context)?.settings is MainScreen)) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      }
    } else {
      // Check if not already on LoginScreen
      if (!(ModalRoute.of(context)?.settings is LoginScreen)) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    }
  }
}
