import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(CupertinoIcons.search),
        iconColor: Colors.grey,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
