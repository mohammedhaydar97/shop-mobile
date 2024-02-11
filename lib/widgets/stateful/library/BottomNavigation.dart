import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shopmobile/screens/CartScree.dart';

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _MainBottomNavigationBarState createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  int _currentIndex = 0;

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartScreen()),
        );
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
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Color(0xFF66EAC7),
      index: _currentIndex,
      onTap: _onTap,
      items: const [
        Icon(Icons.home),
        Icon(Icons.search),
        Icon(Icons.shopping_cart),
        Icon(Icons.favorite),
        Icon(Icons.exit_to_app),
        Icon(Icons.settings),
      ],
    );
  }
}
