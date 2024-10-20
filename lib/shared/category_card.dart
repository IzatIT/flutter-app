import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final int index;
  const CategoryCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Expanded(
            child: Center(
              child: Icon(
                Icons.category,
                size: 80, // Размер иконки
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              'Category ${index + 1}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
