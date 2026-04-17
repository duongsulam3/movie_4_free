import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../core/utils/helper/helper.dart';

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
    _playerDispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant MoviePlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.newVideoUrl != oldWidget.newVideoUrl) {
      buildNewVideoPlayer(widget.newVideoUrl);
    }
  }

  Future<void> _initPlayer(String url) async {
    try {
      final uri = Uri.parse(url);
      _controller = VideoPlayerController.networkUrl(uri);
      await _controller.initialize();
      chewieController = ChewieController(
        videoPlayerController: _controller,
        autoPlay: true,
        allowedScreenSleep: false,
      );
      setState(() {});
    } catch (e) {
      if (mounted) Helper.showInitPlayerErrorSnackBar(context);
      log(e.toString());
    }
  }

  void _playerDispose() {
    _controller.dispose();
    if (chewieController != null) chewieController!.dispose();
  }

  void buildNewVideoPlayer(String newUrl) {
    if (newUrl == "") return;
    if (newUrl != "" && newUrl != _controller.dataSource) {
      _playerDispose();
      _initPlayer(newUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: _controller.value.isInitialized
          ? Chewie(controller: chewieController!)
          : _MoviePlayerFallbackPoster(posterUrl: widget.posterUrl),
    );
  }
}

class _MoviePlayerFallbackPoster extends StatelessWidget {
  const _MoviePlayerFallbackPoster({required this.posterUrl});

  final String posterUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(posterUrl),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        color: Colors.black.withValues(alpha: 0.9),
        child: const Center(
          child: Icon(
            Icons.play_disabled_rounded,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
