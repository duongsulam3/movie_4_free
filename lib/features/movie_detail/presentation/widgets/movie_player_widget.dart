import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/container_with_cached_network_image_provider.dart';
import 'package:smoth_movie_app/helper/helper.dart';
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

  void _initPlayer(String url) async {
    //**** INIT VIDEO CONTROLLER */
    final uri = Uri.parse(url);
    _controller = VideoPlayerController.networkUrl(uri);
    //**** TRY CATCH CONTROLLER INITIALIZE */
    try {
      await _controller.initialize();
    } catch (e) {
      log("Không thể phát video: $e");
    }
    //**** HANDLE CONTROLLER INITIALIZED OR NOT */
    if (_controller.value.isInitialized == false) {
      if (mounted) Helper.showInitPlayerErrorSnackBar(context);
      return;
    } else {
      chewieController = ChewieController(
        videoPlayerController: _controller,
        autoPlay: true,
        allowedScreenSleep: false,
      );
      setState(() {});
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
    if (_controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Chewie(controller: chewieController!),
      );
    } else {
      return ContainerWithCachedNetworkImageProvider(path: widget.posterUrl);
    }
  }
}
