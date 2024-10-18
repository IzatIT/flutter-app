import 'package:flutter/material.dart';

class CategoriesCarouselCard extends StatelessWidget {
  const CategoriesCarouselCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/categories');
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF7868D8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.category,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
