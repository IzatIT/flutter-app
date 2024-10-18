import 'package:first_app/shared/banner_card.dart';
import 'package:flutter/material.dart';

class BannerSection extends StatefulWidget {
  const BannerSection({super.key});

  @override
  _BannerSection createState() => _BannerSection();
}

class _BannerSection extends State<BannerSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 9 / 16,
      child: PageView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return BannerCard();
        },
      ),
    );
  }
}
