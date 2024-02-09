import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopmobile/services/products.dart';
import 'package:shopmobile/widgets/stateful/lists/CategoryList.dart';
import 'package:shopmobile/widgets/stateful/lists/NewReleaseList.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductsApis productsApis = ProductsApis();

    productsApis.fetchData();

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
              CategoryList(),
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
              Container(
                height: 50,
                margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Featured products',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'StolzlDisplay',
                  ),
                ),
              ),
              NewReleaseList(),
            ],
          ),
        ),
      ),
    );
  }
}
