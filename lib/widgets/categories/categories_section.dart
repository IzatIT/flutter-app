import 'package:first_app/shared/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  _CategoriesSection createState() => _CategoriesSection();
}

class _CategoriesSection extends State<CategoriesSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF)),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward, color: Color(0xFF7868D8)),
                onPressed: () {
                  // Handle the action on arrow click
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150, // Increased height for larger category cards
          child: Row(
            children: [
              CategoryCard(),
              CategoryCard(),
              CategoryCard(),
            ],
          ),
        ),
      ],
    );
  }
}
