import 'package:first_app/features/appbar/appbar.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool _isSearching = false;
  bool _isRecording = false;

  final TextEditingController _searchController = TextEditingController();

  void _startSearch() {
    setState(() {
      _isSearching = true;
      _isRecording = false; // Stop recording when search is started
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear(); // Clear input when search is stopped
    });
  }

  void _startVoiceSearch() {
    setState(() {
      _isRecording = true;
      _isSearching = false; // Stop search when recording is started
      _searchController.clear(); // Clear input when starting voice search
    });
  }

  void _stopVoiceSearch() {
    setState(() {
      _isRecording = false;
    });
  }

  void _openAddressSelection() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:
              const Color(0xFF23232C), // Dark background for dialog
          title: const Text('Выберите адрес',
              style: TextStyle(color: Color(0xFFFFFFFF))),
          content: const Text('Здесь будет выбор адреса доставки.',
              style: TextStyle(color: Color(0xFFFFFFFF))),
          actions: <Widget>[
            TextButton(
              child: const Text('Закрыть',
                  style: TextStyle(color: Color(0xFF7868D8))),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          onAddressSelected: _openAddressSelection,
          searchController: _searchController,
          isSearching: _isSearching,
          isRecording: _isRecording,
          onStartSearch: _startSearch,
          onStopSearch: _stopSearch,
          onStartVoiceSearch: _startVoiceSearch,
        ),
        Expanded(
          child: _isSearching ? _searchResults() : _normalBody(),
        ),
      ],
    );
  }

  Widget _normalBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildCategoryCarousel(),
          const SizedBox(height: 16),
          _buildBannerCarousel(),
          const SizedBox(height: 16),
          _buildCategoriesSection(),
          const SizedBox(height: 16),
          _buildProductsGrid(),
        ],
      ),
    );
  }

  Widget _buildCategoryCarousel() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/categories/$index');
            },
            child: Container(
              width: 100,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF7868D8), // Category card color
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.category,
                color: Colors.white,
                size: 40,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBannerCarousel() {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 9 / 16,
      child: PageView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF8AC186), // Banner background color
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'Banner',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoriesSection() {
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
              Expanded(child: _buildCategoryCard('Category 1')),
              Expanded(child: _buildCategoryCard('Category 2')),
              Expanded(child: _buildCategoryCard('Category 3')),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String categoryName) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF8AC186), // Category card color
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.category, size: 50, color: Colors.white),
          const SizedBox(height: 8),
          Text(categoryName, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildProductsGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Products',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFFF)),
          ),
        ),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return _buildProductCard();
          },
        ),
      ],
    );
  }

  Widget _buildProductCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF7868D8), // Product card color
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        children: [
          Expanded(
            child: Center(
              child: Icon(Icons.fastfood, size: 50, color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Product Name', style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text('\$9.99', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _searchResults() {
    return const Center(
      child: Text(
        'Search Results Here',
        style: TextStyle(color: Color(0xFFFFFFFF)),
      ),
    );
  }
}
