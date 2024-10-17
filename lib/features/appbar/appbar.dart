import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Function() onAddressSelected;
  final TextEditingController searchController;
  final bool isSearching;
  final bool isRecording;
  final Function() onStartSearch;
  final Function() onStopSearch;
  final Function() onStartVoiceSearch;

  const CustomAppBar({
    Key? key,
    required this.onAddressSelected,
    required this.searchController,
    required this.isSearching,
    required this.isRecording,
    required this.onStartSearch,
    required this.onStopSearch,
    required this.onStartVoiceSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF33343D), // AppBar background color
      padding: const EdgeInsets.all(16.0), // Padding for the AppBar
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                onPressed: onAddressSelected, // Open address selection dialog
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
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController,
                  enabled: !isRecording, // Disable input if recording
                  onTap: () {
                    onStartSearch();
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    prefixIcon:
                        const Icon(Icons.search, color: Color(0xFF7868D8)),
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Color(0xFF33343D)),
                    suffixIcon: isSearching
                        ? null
                        : IconButton(
                            icon:
                                const Icon(Icons.mic, color: Color(0xFF7868D8)),
                            onPressed: onStartVoiceSearch,
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
}
