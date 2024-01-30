import 'package:flutter/material.dart';
import 'package:shopmobile/widgets/stateful/library/BottomNavigation.dart';
import 'package:shopmobile/widgets/stateful/lists/CategoryList.dart';
import 'package:shopmobile/widgets/stateful/lists/NewReleaseList.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                  'CART',
                  style: TextStyle(
                    fontSize: 44,
                    fontFamily: 'StolzlDisplay',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
