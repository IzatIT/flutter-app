import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ShortsVideoItem extends StatefulWidget {
  const ShortsVideoItem(
      {super.key, required this.index, required this.videoLink});
  final int index;
  final String videoLink;

  @override
  _ShortsVideoItemState createState() => _ShortsVideoItemState();
}

class _ShortsVideoItemState extends State<ShortsVideoItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoLink)
      ..initialize().then((_) {
        setState(() {});
      }).catchError((error) {
        print('Error loading video: $error');
      });
    _controller.setLooping(true);
  }

  AspectRatio _getVideo() {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    );
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('video_${widget.index}'),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 50 && !_controller.value.isPlaying) {
          _controller.play();
        } else if (visiblePercentage <= 50 && _controller.value.isPlaying) {
          _controller.pause();
        }
      },
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            },
            child: Center(
              child: _getVideo(),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 15,
            child: Row(
              children: [
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite, color: Colors.white),
                        ),
                        const Text(
                          'Like',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.comment, color: Colors.white),
                        ),
                        const Text(
                          'Comment',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share, color: Colors.white),
                        ),
                        const Text(
                          'Share',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 15,
            right: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg'),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Seller Name',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product Title',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          '\$123.45',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      child: const Text('Buy Now'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Video Progress Bar at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ValueListenableBuilder(
              valueListenable: _controller,
              builder: (context, VideoPlayerValue value, child) {
                double progress = value.position.inSeconds /
                    value.duration.inSeconds.clamp(1, double.infinity);

                return TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                      begin: 0, end: progress.isNaN ? 0 : progress),
                  duration: const Duration(milliseconds: 1000),
                  builder: (context, animatedProgress, child) {
                    return LinearProgressIndicator(
                      value: animatedProgress,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.white),
                      backgroundColor: Colors.white.withOpacity(0.3),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
