import 'package:first_app/features/address/address-select.dart';
import 'package:first_app/features/navbar/navbar.dart';
import 'package:first_app/features/notification/notification.dart';
import 'package:first_app/shared/category_carousel_card.dart';
import 'package:first_app/widgets/banners/banner_section.dart';
import 'package:first_app/widgets/categories/categories_section.dart';
import 'package:first_app/widgets/screens/basket.dart';
import 'package:first_app/widgets/screens/categories.dart';
import 'package:first_app/widgets/products/products_section.dart';
import 'package:first_app/widgets/screens/home.dart';
import 'package:first_app/widgets/screens/profile.dart';
import 'package:first_app/widgets/screens/shorts.dart';
import 'package:first_app/features/search/search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const ShortsScreen(),
    const ProfileScreen(),
    const BasketScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      backgroundColor: const Color(0xFF231921),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: const Color(0xFF33343D),
      toolbarHeight: 140,
      title: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [AddressSelectFeature(), NotificationFeature()],
          ),
          SizedBox(height: 8),
          HeaderSearchFeature()
        ],
      ),
    );
  }
}
