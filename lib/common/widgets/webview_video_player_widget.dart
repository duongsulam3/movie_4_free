import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewVideoPlayerWidget extends StatefulWidget {
  const WebviewVideoPlayerWidget({
    super.key,
    required this.url,
    required this.thumbUrl,
  });

  final String url;
  final String thumbUrl;

  @override
  State<WebviewVideoPlayerWidget> createState() =>
      _WebviewVideoPlayerWidgetState();
}

class _WebviewVideoPlayerWidgetState extends State<WebviewVideoPlayerWidget> {
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    initWebViewController();
  }

  @override
  void dispose() {
    pageDispose();
    super.dispose();
  }

  void pageDispose() {
    controller.clearCache();
    controller.clearLocalStorage();
    _WebviewVideoPlayerWidgetState();
  }

  void initWebViewController() {
    final uri = Uri.parse(widget.url);
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

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: WebViewWidget(controller: controller),
    );
  }
}
