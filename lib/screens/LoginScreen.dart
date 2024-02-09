import 'package:flutter/material.dart';
import 'package:shopmobile/screens/MainScreen.dart';
import 'package:shopmobile/services/User.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserApis userApi = UserApis();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'PROSHOP.IO',
            style: TextStyle(
              fontSize: 44,
              fontFamily: 'StolzlDisplay',
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              onPressed: () async {
                String email = _emailController.text;
                String password = _passwordController.text;

                Future<bool> loginSuccessful =
                    userApi.loginUsingEmail(email, password);

                if (await loginSuccessful) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                  _emailController.clear();
                  _passwordController.clear();
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        title: const Text("Credentials are wrong"),
                        actions: [
                          ButtonBar(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(dialogContext).pop();
                                },
                                child: const Text('close'),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Login'),
            ),
          ),
          const SizedBox(height: 20),
          const Text("Don't have an account Already?"),
          const Text(
            "SIGN UP",
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
