import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class VideoPlayerScreen extends StatefulWidget {
  final List<String> videoUrls;

  const VideoPlayerScreen({Key? key, required this.videoUrls})
      : super(key: key);

  @override
  VideoPlayerScreenState createState() => VideoPlayerScreenState();
}

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  int _currentVideoIndex = 0;
  bool _isFavorite = false;
  double _playbackSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Future<void> _initializePlayer() async {
    _videoPlayerController =
        VideoPlayerController.network(widget.videoUrls[_currentVideoIndex]);
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 20 / 9,
      autoPlay: true,
      looping: false,
      showControls: true,
      customControls: const Row(
        children: [
          Icon(Icons.play_arrow),
          Icon(Icons.play_arrow),
          Icon(Icons.play_arrow),
          Icon(Icons.play_arrow),
          Icon(Icons.play_arrow),
          Icon(Icons.play_arrow),
        ],
      ),
      allowPlaybackSpeedChanging: true,
      autoInitialize:
          true, // Use autoInitialize instead of allowedPlaybackRates
    );

    setState(() {});
  }

  Future<void> _downloadVideo() async {
    Dio dio = Dio();
    String url = widget.videoUrls[_currentVideoIndex];
    String fileName = url.split('/').last;
    String savePath =
        '${(await getApplicationDocumentsDirectory()).path}/$fileName';

    await dio.download(url, savePath);

    // You can store the downloaded video's path or perform any additional tasks here.
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
    _initializePlayer();
    _loadFavoriteStatus();
  }

  void _changeSpeed(double speed) {
    setState(() {
      _playbackSpeed = speed;
    });
    _videoPlayerController.setPlaybackSpeed(speed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
        actions: [
          IconButton(
            icon: _isFavorite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
            onPressed: _toggleFavorite,
          ),
          PopupMenuButton(
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
        ],
      ),
      body: _videoPlayerController.value.isInitialized
          ? Chewie(
              controller: _chewieController,
            )
          : const Center(child: CircularProgressIndicator()),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.file_download),
            label: 'Download Video',
            onTap: _downloadVideo,
          ),
          SpeedDialChild(
            child: const Icon(Icons.skip_previous),
            label: 'Previous Video',
            onTap: () {
              if (_currentVideoIndex > 0) {
                _changeVideo(_currentVideoIndex - 1);
              }
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.skip_next),
            label: 'Next Video',
            onTap: () {
              if (_currentVideoIndex < widget.videoUrls.length - 1) {
                _changeVideo(_currentVideoIndex + 1);
              }
            },
          ),
        ],
        child: const Icon(Icons.add),
      ),
    );
  }
}
