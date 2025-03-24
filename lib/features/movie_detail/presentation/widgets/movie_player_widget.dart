import 'dart:developer';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/container_with_cached_network_image_provider.dart';
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
    if (chewieController != null) chewieController!.dispose();
    super.dispose();
  }

  _initPlayer(String url) async {
    try {
      final uri = Uri.parse(url);
      _controller = VideoPlayerController.networkUrl(uri);
      await _controller.initialize();
      chewieController = ChewieController(
        videoPlayerController: _controller,
        autoPlay: true,
        allowedScreenSleep: false,
        looping: false,
      );
      setState(() {});
    } catch (e) {
      log("Không thể phát video url: $url");
      return;
    }
  }

  void buildNewVideoPlayer(String newUrl) {
    if (newUrl != "" && newUrl != _controller.dataSource) {
      _controller.dispose();
      _initPlayer(newUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    buildNewVideoPlayer(widget.newVideoUrl);
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Chewie(controller: chewieController!),
          )
        : ContainerWithCachedNetworkImageProvider(path: widget.posterUrl);
  }
}
