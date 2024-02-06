import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({Key? key}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _showControls = true;
  int _currentVideoIndex = 0;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  void _toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isFavorite = !_isFavorite;
      // Store the favorite status in SharedPreferences
      prefs.setBool('favorite_$_currentVideoIndex', _isFavorite);
    });
  }

  void _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFavorite = prefs.getBool('favorite_$_currentVideoIndex') ?? false;
    setState(() {
      _isFavorite = isFavorite;
    });
  }

  void _changeVideo(int newIndex) {
    setState(() {
      _currentVideoIndex = newIndex;
    });
    _initializeVideoPlayer();
    _loadFavoriteStatus();
  }

  void _changeSpeed(double speed) {
    setState(() {});
    _videoPlayerController!.setPlaybackSpeed(speed);
  }

  Future<void> _initializeVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.network(
        "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4");

    await _videoPlayerController!.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      autoPlay: true,
      allowFullScreen: true,
      looping: true,
      showControls: false,
    );

    _videoPlayerController!.addListener(() {
      setState(() {}); // Update the UI when video position changes
    });

    setState(() {}); // Rebuild the widget tree to reflect the changes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _showControls = !_showControls;
          });

          // If video is playing, hide controls after a delay
          if (_videoPlayerController!.value.isPlaying && !_showControls) {
            Future.delayed(const Duration(seconds: 3), () {
              setState(() {
                _showControls = false;
              });
            });
          }
        },
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              _chewieController != null &&
                      _chewieController!
                          .videoPlayerController.value.isInitialized
                  ? Chewie(controller: _chewieController!)
                  : const CircularProgressIndicator(),
              Visibility(
                visible: _showControls &&
                    _chewieController != null &&
                    !_chewieController!.isFullScreen,
                child: _buildCustomControls(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomControls() {
    Duration currentPosition = _videoPlayerController!.value.position;
    Duration totalDuration = _videoPlayerController!.value.duration;

    String formatDuration(Duration duration) {
      return "${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}";
    }

    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 130,
          ),
          // if (_videoPlayerController!.value.isBuffering)
          //   const CircularProgressIndicator(
          //     valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          //   ),
          // if (!_videoPlayerController!.value.isBuffering)
          //   // Seek bar
          Slider(
            value: currentPosition.inSeconds.toDouble(),
            min: 0.0,
            max: totalDuration.inSeconds.toDouble(),
            onChanged: (value) {
              _videoPlayerController!.seekTo(Duration(seconds: value.toInt()));
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatDuration(currentPosition),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  formatDuration(totalDuration),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => null,
                icon: const Icon(
                  Icons.skip_previous,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              IconButton(
                icon: _videoPlayerController!.value.isPlaying
                    ? const Icon(
                        Icons.pause,
                        size: 30,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.play_arrow,
                        size: 30,
                        color: Colors.white,
                      ),
                onPressed: () {
                  setState(() {
                    _videoPlayerController!.value.isPlaying
                        ? const Icon(
                            Icons.pause,
                            size: 30,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.play_arrow,
                            size: 30,
                            color: Colors.white,
                          );
                  });
                  if (_videoPlayerController!.value.isPlaying) {
                    _videoPlayerController!.pause();
                  } else {
                    _videoPlayerController!.play();
                  }
                },
              ),
              IconButton(
                onPressed: () => null,
                icon: const Icon(
                  Icons.skip_next,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 70,
              ),
              PopupMenuButton(
                color: AppColors.whiteColor,
                icon: const Icon(
                  Icons.speed,
                  size: 28,
                  color: Colors.white,
                ),
                onSelected: (speed) => _changeSpeed(speed),
                itemBuilder: (BuildContext context) {
                  return [
                    0.5,
                    1.0,
                    1.25,
                    1.5,
                    2.0,
                  ].map((speed) {
                    return PopupMenuItem(
                      value: speed,
                      child: Text('${speed}x'),
                    );
                  }).toList();
                },
              ),
              const Icon(
                Icons.download_sharp,
                size: 25,
                color: Colors.white,
              ),
              IconButton(
                icon: _isFavorite
                    ? const Icon(
                        Icons.favorite,
                        size: 30,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        size: 30,
                        color: Colors.white,
                      ),
                onPressed: _toggleFavorite,
              ),
              IconButton(
                icon: const Icon(
                  Icons.fullscreen,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  _chewieController!.enterFullScreen();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
