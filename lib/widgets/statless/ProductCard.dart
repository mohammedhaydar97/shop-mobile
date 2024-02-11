import 'dart:math';

import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:shopmobile/models/Product.dart';
import 'package:shopmobile/screens/SingleProduct.dart';

class ProductCard extends StatelessWidget {
  final int index;
  final Product product;

  const ProductCard({Key? key, required this.product, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isIndexEven = index % 2 == 0;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleProductScreen(
              productName: product.name,
              productDescription: product.description,
              productPrice: product.price,
              productImage: product.image,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Stack(
              children: [
                Container(
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: isIndexEven
                        ? const Color(0xFF66EAC7)
                        : const Color(0xFFFF6868),
                  ),
                ),
                Center(
                  child: Image.network(
                    product.image,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            width: 190,
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Align children to the start (left)
              children: [
                Text(
                  '\$${product.price}', // Display product price
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'StolzlDisplay',
                  ),
                ),
                // const Expanded(
                //   child: RatingBar.readOnly(
                //     size: 25,
                //     filledIcon: Icons.star,
                //     emptyIcon: Icons.star_border,
                //     initialRating: 4,
                //     maxRating: 5,
                //   ),
                // ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.name,
                    style: const TextStyle(
                      fontFamily: 'StolzlDisplay',
                      fontSize: 16.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
