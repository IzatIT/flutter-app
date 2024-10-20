import 'package:first_app/widgets/index.dart';
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
