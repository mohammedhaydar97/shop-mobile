import 'dart:math';

import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final int index;

  const ProductCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isIndexEven = index % 2 == 0;

    return Column(
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
                child: Image.asset(
                  'assets/images/shoes1.png',
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
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$74',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'StolzlDisplay',
                    ),
                  ),
                  Expanded(
                      child: RatingBar.readOnly(
                    size: 25,
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                    initialRating: 4,
                    maxRating: 5,
                  )),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Reebok Red Run',
                  style: TextStyle(
                    fontFamily: 'StolzlDisplay',
                    fontSize: 16.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
