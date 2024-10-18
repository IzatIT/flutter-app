import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF8AC186), // Category card color
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.category, size: 50, color: Colors.white),
            SizedBox(height: 8),
            Text(
              'Category 3',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
