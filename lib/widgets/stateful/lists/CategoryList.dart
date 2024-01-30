import 'package:flutter/material.dart';
import 'package:shopmobile/widgets/statless/categoryIcon.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(6, (index) {
            return CategoryIcon(index: index);
          }),
        ),
      ),
    );
  }
}
