import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconBackButton extends StatelessWidget {
  const IconBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Icon(
        CupertinoIcons.arrow_left,
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.black.withValues(alpha: 0.7),
            offset: const Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
    );
  }
}
