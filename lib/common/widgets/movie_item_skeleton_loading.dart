import 'package:flutter/material.dart';

class MovieItemSkeletonLoading extends StatelessWidget {
  const MovieItemSkeletonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 5, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 20, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}
