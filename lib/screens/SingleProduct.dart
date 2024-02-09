import 'package:flutter/material.dart';

class SingleProductScreen extends StatelessWidget {
  final String productName;
  final String productDescription;
  final double productPrice;
  final String productImage;

  const SingleProductScreen({
    Key? key,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6868),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Image.asset(
                  'assets/images/shoes1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'StolzlDisplay',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '\$${productPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 38,
                    fontFamily: 'StolzlDisplay',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  productDescription,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'StolzlDisplay',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(1, 60),
                      backgroundColor: Color(0xFF64ECC7),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                          fontFamily: 'StolzlDisplay',
                          fontSize: 23,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
