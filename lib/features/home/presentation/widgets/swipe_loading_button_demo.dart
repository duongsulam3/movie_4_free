import 'package:flutter_supper_app_core/core.dart';

class SwipeLoadingButtonDemo extends StatefulWidget {
  const SwipeLoadingButtonDemo({super.key});

  @override
  State<SwipeLoadingButtonDemo> createState() => _SwipeLoadingButtonDemoState();
}

class _SwipeLoadingButtonDemoState extends State<SwipeLoadingButtonDemo> {
  bool _isLoading = false;

  Future<void> _onPressed() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.v),
      child: SwipeLoadingButton(
        isLoading: _isLoading,
        title: 'Test Swipe Loading',
        onPressed: _onPressed,
        loadingIndicatorColor: Colors.red,
        titleStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
