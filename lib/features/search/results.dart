import 'package:flutter/material.dart';

class HeaderSearchResults extends StatelessWidget {
  final Function stopSearch;
  final Function stopVoiceSearch;
  final bool isRecording;
  final Function voiceRecordingAnimation;

  const HeaderSearchResults({
    super.key,
    required this.isRecording,
    required this.voiceRecordingAnimation,
    required this.stopVoiceSearch,
    required this.stopSearch,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        stopSearch();
        stopVoiceSearch();
      },
      child: Column(
        children: [
          Expanded(
            child: isRecording
                ? voiceRecordingAnimation() // Voice recording animation
                : const Center(
                    child: Text(
                      'Search results will appear here...',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFFFFFFF),
                      ), // Search result text color
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
