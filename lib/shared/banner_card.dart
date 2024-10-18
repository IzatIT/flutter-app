import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF8AC186),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text(
          'Banner',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
