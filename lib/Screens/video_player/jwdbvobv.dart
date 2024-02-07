import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  bool _showControls = false; // Initially hide controls
  int _currentVideoIndex = 0;
  bool _isFavorite = false;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
    _loadFavoriteStatus();
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

  void changeVideo(int newIndex, setState) {
    setState(() {
      _currentVideoIndex = newIndex;
    });
    _initializeVideoPlayer();
    _loadFavoriteStatus();
  }

  Future<void> _initializeVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.network(
        "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4");

    await _videoPlayerController!.initialize(); // Initialize video player

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      autoPlay: true, // Auto play the video
      looping: true,
      showControls: false, // Initially hide controls
      customControls: _buildCustomControls(),
    );

    _videoPlayerController!.addListener(() {
      setState(() {}); // Update the UI when video position changes
    });

    setState(() {});
  }

  void _toggleShowControls() {
    setState(() {
      _showControls = !_showControls;
    });
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });

    if (_isFullScreen) {
      // Enter full-screen mode
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    } else {
      // Exit full-screen mode
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }

    _toggleShowControls(); // Show controls when entering full-screen
  }

  void _changeSpeed(double speed) {
    setState(() {});
    _videoPlayerController!.setPlaybackSpeed(speed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.profileBackgroundColor,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap:
                      _toggleShowControls, // Toggle controls visibility on tap
                  child: _isFullScreen
                      ? Center(
                          child: AspectRatio(
                            aspectRatio:
                                16 / 9, // Set aspect ratio for full screen
                            child: Chewie(controller: _chewieController!),
                          ),
                        )
                      : _chewieController != null &&
                              _chewieController!
                                  .videoPlayerController.value.isInitialized
                          ? Chewie(controller: _chewieController!)
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SpinKitCircle(
                                  color: AppColors.loginColor,
                                  size: 60.0,
                                ),
                                Text(
                                  "Please Wait... Movie is Loading....",
                                  style: TextStyle(
                                    color: AppColors.loginColor,
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: AnimatedOpacity(
                  opacity: _showControls ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 300),
                  child: _buildCustomControls(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCustomControls() {
    Duration currentPosition = _videoPlayerController!.value.position;
    Duration totalDuration = _videoPlayerController!.value.duration;

    String formatDuration(Duration duration) {
      return "${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
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
                      ? Icon(
                          Icons.pause,
                          size: 30,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.play_arrow,
                          size: 30,
                          color: Colors.white,
                        ),
                  onPressed: () {
                    setState(() {
                      if (_videoPlayerController!.value.isPlaying) {
                        _videoPlayerController!.pause();
                      } else {
                        _videoPlayerController!.play();
                      }
                    });
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
              ],
            ),
            Row(
              children: [
                PopupMenuButton(
                  icon: Icon(Icons.speed),
                  iconSize: 26,
                  iconColor: AppColors.whiteColor,
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
                  icon: _isFullScreen
                      ? Icon(
                          Icons.fullscreen_exit,
                          size: 30,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.fullscreen,
                          size: 30,
                          color: Colors.white,
                        ),
                  onPressed: _toggleFullScreen,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
