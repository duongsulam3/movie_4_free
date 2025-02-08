import 'package:flutter/material.dart';

class IconBackButton extends StatelessWidget {
  const IconBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: sWidth / (sWidth / 30),
        shadows: [
          const Shadow(
            color: Colors.black,
            offset: Offset(3, -1),
          ),
        ],
      ),
    );
  }
}
