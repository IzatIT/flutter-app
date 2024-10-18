import 'package:first_app/shared/category_carousel_card.dart';
import 'package:flutter/material.dart';

class CategoriesCarousel extends StatefulWidget {
  const CategoriesCarousel({super.key});

  @override
  _CategoriesCarousel createState() => _CategoriesCarousel();
}

class _CategoriesCarousel extends State<CategoriesCarousel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CategoriesCarouselCard();
        },
      ),
    );
  }
}
