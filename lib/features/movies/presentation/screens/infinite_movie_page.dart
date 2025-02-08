import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';

class InfiniteMoviePage extends StatelessWidget {
  final String title;
  const InfiniteMoviePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ResponsiveText(text: title, fontSize: 24),
      ),
      body: const Center(child: Text("Infinite Movie Page")),
    );
  }
}
