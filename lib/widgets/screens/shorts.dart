import 'package:first_app/shared/shorts_video_item.dart';
import 'package:flutter/material.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  _ShortsScreenState createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  final List<String> _videoLinks = [
    "assets/videos/example2.mp4",
    "assets/videos/example.mp4",
    "assets/videos/example3.mp4",
    "assets/videos/example4.mp4",
    "assets/videos/example.mp4",
    "assets/videos/example2.mp4",
    "assets/videos/example3.mp4",
    "assets/videos/example4.mp4",
    "assets/videos/example.mp4",
    "assets/videos/example2.mp4",
    "assets/videos/example3.mp4",
    "assets/videos/example4.mp4",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: 10,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return ShortsVideoItem(
                index: index,
                videoLink: _videoLinks[index],
              );
            },
          ),
          Positioned(
            top: 40,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
