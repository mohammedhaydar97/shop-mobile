import 'package:flutter/material.dart';
import 'package:shopmobile/widgets/statless/ProductCard.dart';

class NewReleaseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1400,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(10, (index) {
            return ProductCard(index: index);
          }),
        ),
      ),
    );
  }
}
