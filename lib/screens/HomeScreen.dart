import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shopmobile/screens/CartScree.dart';
import 'package:shopmobile/widgets/stateful/library/BottomNavigation.dart';
import 'package:shopmobile/widgets/stateful/lists/CategoryList.dart';
import 'package:shopmobile/widgets/stateful/lists/NewReleaseList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'EXPLORE',
                  style: TextStyle(
                    fontSize: 44,
                    fontFamily: 'StolzlDisplay',
                  ),
                ),
              ),
              const CategoryList(),
              Row(
                children: [
                  Container(
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'New Arrival',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'StolzlDisplay',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      alignment: Alignment.centerRight,
                      child: const Text(
                        'All',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'StolzlDisplay',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              NewReleaseList(),
              NewReleaseList(),
            ],
          ),
        ),
      ),
    );
  }
}
