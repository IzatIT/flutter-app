import 'package:first_app/shared/index.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  _CategoriesSection createState() => _CategoriesSection();
}

class _CategoriesSection extends State<CategoriesSection> {
  @override
  Widget build(BuildContext context) {
    const int columns = 3;

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
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 130,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 1.0,
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return CategoryCard(
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}
