import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../core/utils/helper/helper.dart';

enum _MoviePlayerViewState {
  initializing,
  ready,
  error,
}

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
  VideoPlayerController? _controller;
  ChewieController? chewieController;
  bool _isInitializing = false;
  bool _hasInitError = false;
  int _initRequestId = 0;

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
    final requestId = ++_initRequestId;
    final controller = VideoPlayerController.networkUrl(Uri.parse(url));

    if (mounted) {
      setState(() {
        _isInitializing = true;
        _hasInitError = false;
      });
    }

    try {
      await controller.initialize();

      // Ignore stale async completion when a newer source was requested.
      if (!mounted || requestId != _initRequestId) {
        controller.dispose();
        return;
      }

      _controller = controller;
      chewieController = ChewieController(
        videoPlayerController: controller,
        autoPlay: true,
        allowedScreenSleep: false,
      );

      setState(() {
        _isInitializing = false;
        _hasInitError = false;
      });
    } catch (e) {
      controller.dispose();
      if (mounted) Helper.showInitPlayerErrorSnackBar(context);
      log(e.toString());

      if (!mounted || requestId != _initRequestId) return;
      setState(() {
        _isInitializing = false;
        _hasInitError = true;
      });
    }
  }

  void _playerDispose() {
    _controller?.dispose();
    _controller = null;
    chewieController?.dispose();
    chewieController = null;
  }

  void buildNewVideoPlayer(String newUrl) {
    if (newUrl == "") return;
    final currentUrl = _controller?.dataSource;
    if (newUrl != currentUrl) {
      _playerDispose();
      _initPlayer(newUrl);
    }
  }

  _MoviePlayerViewState _resolveViewState(bool hasReadyController) {
    if (_isInitializing) return _MoviePlayerViewState.initializing;
    if (hasReadyController) return _MoviePlayerViewState.ready;
    if (_hasInitError) return _MoviePlayerViewState.error;
    return _MoviePlayerViewState.error;
  }

  Widget _buildPlayerContent(_MoviePlayerViewState viewState) {
    switch (viewState) {
      case _MoviePlayerViewState.initializing:
        return _MoviePlayerFallbackPoster(
          posterUrl: widget.posterUrl,
          isLoading: true,
        );
      case _MoviePlayerViewState.ready:
        return Chewie(controller: chewieController!);
      case _MoviePlayerViewState.error:
        return _MoviePlayerFallbackPoster(
          posterUrl: widget.posterUrl,
          isLoading: false,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    final hasReadyController = controller != null &&
        controller.value.isInitialized &&
        chewieController != null;
    final viewState = _resolveViewState(hasReadyController);

    return AspectRatio(
      aspectRatio: controller?.value.aspectRatio ?? (16 / 9),
      child: _buildPlayerContent(viewState),
    );
  }
}

class _MoviePlayerFallbackPoster extends StatelessWidget {
  const _MoviePlayerFallbackPoster({
    required this.posterUrl,
    this.isLoading = false,
  });

  final String posterUrl;
  final bool isLoading;

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
        child: Center(
          // Built feature: loading mode uses spinner, error mode keeps disabled icon.
          child: isLoading
              ? const SizedBox(
                  width: 36,
                  height: 36,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  ),
                )
              : const Icon(
                  Icons.play_disabled_rounded,
                  size: 50,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
