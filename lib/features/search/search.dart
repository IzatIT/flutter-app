import 'package:flutter/material.dart';

class HeaderSearchFeature extends StatefulWidget {
  const HeaderSearchFeature({super.key});

  @override
  _HeaderSearchFeatureState createState() => _HeaderSearchFeatureState();
}

class _HeaderSearchFeatureState extends State<HeaderSearchFeature> {
  bool _isSearching = false;
  bool _isRecording = false;

  final TextEditingController _searchController = TextEditingController();

  void _startSearch() {
    setState(() {
      _isSearching = true;
      _isRecording = false;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
    });
  }

  void _startVoiceSearch() {
    setState(() {
      _isRecording = true;
      _isSearching = false;
      _searchController.clear();
    });
  }

  void _stopVoiceSearch() {
    setState(() {
      _isRecording = false;
    });
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

  @override
  Widget build(BuildContext context) {
    return Row(
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
              fillColor:
                  const Color(0xFFFFFFFF), // White background for search input
              prefixIcon: const Icon(Icons.search, color: Color(0xFF7868D8)),
              hintText: 'Search',
              hintStyle:
                  const TextStyle(color: Color(0xFF33343D)), // Hint text color
              suffixIcon: _isSearching
                  ? null
                  : IconButton(
                      icon: const Icon(Icons.mic, color: Color(0xFF7868D8)),
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
    );
  }
}
