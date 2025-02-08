import 'dart:developer';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:video_player/video_player.dart';

class MoviePlayerWidget extends StatefulWidget {
  final String m3u8Url;
  final String posterUrl;
  final String newVideoUrl;
  const MoviePlayerWidget({
    super.key,
    required this.m3u8Url,
    required this.posterUrl,
    this.newVideoUrl = "",
  });

  @override
  State<MoviePlayerWidget> createState() => _MoviePlayerWidgetState();
}

class _MoviePlayerWidgetState extends State<MoviePlayerWidget> {
  bool isLink404 = false;
  late VideoPlayerController _controller;
  ChewieController? chewieController;
  @override
  void initState() {
    _initPlayer(widget.m3u8Url);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  _initPlayer(String url) async {
    var uri = Uri.parse(url);
    log(uri.toString());
    _controller = VideoPlayerController.networkUrl(uri);
    await _controller.initialize();
    chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      allowedScreenSleep: false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: ResponsiveText(
            text: errorMessage,
            fontSize: 16,
          ),
        );
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // log(widget.newVideoUrl);
    if (widget.newVideoUrl != "" &&
        widget.newVideoUrl != _controller.dataSource) {
      _controller.dispose();
      _initPlayer(widget.newVideoUrl);
    }
    return _controller.value.isInitialized
        ? GestureDetector(
            onTap: () {
              setState(
                () {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                },
              );
            },
            onDoubleTap: () {},
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Chewie(controller: chewieController!),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.posterUrl,
                ),
                fit: BoxFit.fill,
              ),
            ),
          );
  }
}
