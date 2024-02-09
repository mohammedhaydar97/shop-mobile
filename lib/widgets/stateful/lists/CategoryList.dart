import 'package:flutter/material.dart';
import 'package:shopmobile/widgets/statless/categoryIcon.dart';

class CategoryList extends StatelessWidget {
  CategoryList({Key? key}) : super(key: key);

  final List<Map<String, String>> categories = [
    {"name": "Category 1", "imageUrl": "assets/icons/voice.png"},
    {"name": "Category 2", "imageUrl": "assets/icons/smartphone.png"},
    {"name": "Category 3", "imageUrl": "assets/icons/controller.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(categories.length, (index) {
            final category = categories[index];
            return CategoryIcon(
              name: category['name']!,
              imageUrl: category['imageUrl']!,
            );
          }),
        ),
      ),
    );
  }
}
