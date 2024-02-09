import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final String name;
  final String imageUrl;

  const CategoryIcon({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.0,
      height: 75.0,
      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 5), // Spacer
        ],
      ),
    );
  }
}
