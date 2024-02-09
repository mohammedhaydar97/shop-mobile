import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shopmobile/screens/CartScree.dart';
import 'package:shopmobile/screens/HomeScreen.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key); // Fix constructor

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final screens = [HomeScreen(), CartScreen(), CartScreen()];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        print('Home icon tapped');
        break;
      case 1:
        print('Search icon tapped');
        break;
      case 2:
        setState(() {
          _currentIndex = 2;
        });
        break;
      case 3:
        print('Favorite icon tapped');
        break;
      case 4:
        print('Person icon tapped');
        break;
      case 5:
        print('Settings icon tapped');
        break;
    }

    fetchData();
  }

  Future<void> fetchData() async {
    final String apiUrl =
        'https://programmertest.district91.com/api/products'; // Replace with your API endpoint

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        final Map<String, dynamic> data = json.decode(response.body);

        // Print the result
        print('API Response: $data');
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ProShop',
          style: TextStyle(
            fontFamily: 'StolzlDisplay',
          ),
        ),
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xFF66EAC7),
        index: _currentIndex,
        onTap: _onTap,
        items: const [
          Icon(Icons.home),
          Icon(Icons.search),
          Icon(Icons.shopping_cart),
          Icon(Icons.favorite),
          Icon(Icons.person),
          Icon(Icons.settings),
        ],
      ),
    );
  }
}
