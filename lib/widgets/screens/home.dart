import 'package:first_app/widgets/banners/banner_section.dart';
import 'package:first_app/widgets/categories/categories_carousel.dart';
import 'package:first_app/widgets/categories/categories_section.dart';
import 'package:first_app/widgets/products/products_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          CategoriesCarousel(),
          SizedBox(height: 16),
          BannerSection(),
          SizedBox(height: 16),
          CategoriesSection(),
          SizedBox(height: 16),
          ProductWidget(),
        ],
      ),
    );
  }
}
