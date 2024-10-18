// custom_bottom_nav_bar.dart

import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ondemand_video),
          label: 'Shorts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket),
          label: 'Basket',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: const Color(0xFF7868D8), // Selected color
      unselectedItemColor: const Color(0xFFCCCCCC), // Unselected color
      onTap: onTap, // Callback for item tap
      backgroundColor: const Color(0xFF33343D), // Background color
    );
  }
}
