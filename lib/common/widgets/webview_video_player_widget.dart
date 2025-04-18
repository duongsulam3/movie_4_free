import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewVideoPlayerWidget extends StatefulWidget {
  const WebviewVideoPlayerWidget({
    super.key,
    required this.url,
    required this.thumbUrl,
    this.newVideoUrl = "",
  });

  final String url;
  final String thumbUrl;
  final String newVideoUrl;

  @override
  State<WebviewVideoPlayerWidget> createState() =>
      _WebviewVideoPlayerWidgetState();
}

class _WebviewVideoPlayerWidgetState extends State<WebviewVideoPlayerWidget> {
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    initWebViewController(widget.url);
  }

  @override
  void dispose() {
    controllerDispose();
    super.dispose();
  }

  void controllerDispose() {
    controller.loadRequest(Uri.parse('about:blank'));
    controller.clearCache();
    controller.clearLocalStorage();
  }

  void initWebViewController(String url) {
    final uri = Uri.parse(url);
    log("Phát video: $url");
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {
            throw error.toString();
          },
          onWebResourceError: (WebResourceError error) {
            throw error.toString();
          },
        ),
      )
      ..loadRequest(uri);
  }

  Future<void> buildNewVideoPlayer(String newUrl) async {
    if (newUrl != "" && newUrl != await controller.currentUrl()) {
      final uri = Uri.parse(newUrl);
      controller.loadRequest(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    buildNewVideoPlayer(widget.newVideoUrl);
    return AspectRatio(
      aspectRatio: 1,
      child: WebViewWidget(controller: controller),
    );
  }
}
