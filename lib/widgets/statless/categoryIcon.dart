import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final int index;

  const CategoryIcon({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.0,
      height: 75.0,
      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: Center(
        child: Text(
          '$index',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
