import 'package:first_app/features/navbar/navbar.dart';
import 'package:first_app/widgets/basket.dart';
import 'package:first_app/widgets/categories.dart';
import 'package:first_app/widgets/profile.dart';
import 'package:first_app/widgets/shorts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false;
  bool _isRecording = false;
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const CategoriesWidget(),
    const ShortsWidget(),
    const ProfileWidget(),
    const BasketWidget(),
  ];

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _isSearching ? _searchResults() : _normalBody(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      backgroundColor: const Color(0xFF231921), // Background color for the body
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: const Color(0xFF33343D), // AppBar background color
      toolbarHeight: 140, // Increased height for AppBar for two rows
      title: Column(
        children: [
          // First row: delivery address button left and notification icon right
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.location_on, color: Color(0xFF7868D8)),
                label: const Row(
                  children: [
                    Text('Адрес доставки',
                        style: TextStyle(color: Color(0xFFFFFFFF))),
                    Icon(Icons.arrow_drop_down, color: Color(0xFF7868D8)),
                  ],
                ),
                onPressed:
                    _openAddressSelection, // Open address selection dialog
              ),
              IconButton(
                icon: const Icon(Icons.notifications, color: Color(0xFF7868D8)),
                onPressed: () {
                  // Open notifications
                },
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Second row: Search bar with search and mic icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  enabled: !_isRecording, // Disable input if recording
                  onTap: () {
                    _startSearch();
                    _stopVoiceSearch(); // Stop recording when tapping input
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(
                        0xFFFFFFFF), // White background for search input
                    prefixIcon:
                        const Icon(Icons.search, color: Color(0xFF7868D8)),
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                        color: Color(0xFF33343D)), // Hint text color
                    suffixIcon: _isSearching
                        ? null
                        : IconButton(
                            icon:
                                const Icon(Icons.mic, color: Color(0xFF7868D8)),
                            onPressed: _startVoiceSearch,
                          ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _normalBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          // First Section: Horizontal Carousel of Square Category Cards
          _buildCategoryCarousel(),

          const SizedBox(height: 16),

          // Second Section: Horizontal Banner Carousel (Full-width 16:9)
          _buildBannerCarousel(),

          const SizedBox(height: 16),

          // Third Section: Categories with Title and Arrow
          _buildCategoriesSection(),

          const SizedBox(height: 16),

          // Fourth Section: Products Grid
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
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF8AC186), // Category card color
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.category, size: 50, color: Colors.white),
                      SizedBox(height: 8),
                      Text(
                        'Category 1',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF8AC186), // Category card color
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.category, size: 50, color: Colors.white),
                      SizedBox(height: 8),
                      Text(
                        'Category 2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF8AC186), // Category card color
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.category, size: 50, color: Colors.white),
                      SizedBox(height: 8),
                      Text(
                        'Category 3',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductsGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recommendations',
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:
                  3 / 5.6, // Aspect ratio of 3:4 for the product cards
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return Container(
                height: 250, // Increased height for more space
                decoration: BoxDecoration(
                  color: const Color(
                      0xFFFFFFFF), // White background for product cards
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio:
                          3 / 4, // 3:4 aspect ratio for the product image
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(
                              0xFF7868D8), // Placeholder color for product image
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '\$100.00',
                                style: TextStyle(
                                    color: Color(0xFFFFABC7)), // Price color
                              ),
                              SizedBox(height: 4),
                              Text(
                                '\$120.00',
                                style: TextStyle(
                                  color: Color(0xFF33343D),
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Product Title',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    Color(0xFF33343D)), // Product title color
                          ),
                          SizedBox(height: 4),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.orange,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '5.0 | 2300 feedbacks',
                                style: TextStyle(
                                  color:
                                      Color(0xFF33343D), // Feedback text color
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _searchResults() {
    return GestureDetector(
      onTap: () {
        _stopSearch();
        _stopVoiceSearch(); // Stop voice search when clicking outside search
      },
      child: Column(
        children: [
          Expanded(
            child: _isRecording
                ? _voiceRecordingAnimation() // Voice recording animation
                : const Center(
                    child: Text(
                      'Search results will appear here...',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFFFFFFF)), // Search result text color
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _voiceRecordingAnimation() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.mic,
            size: 100,
            color: Colors.red,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
