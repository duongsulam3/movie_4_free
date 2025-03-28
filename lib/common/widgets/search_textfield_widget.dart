import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.textFieldHeight = 30,
    this.textFieldFontSize = 11,
    this.hintText = "",
    this.hintFontSize = 11,
    this.isFocus = true,
    this.onTap,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
  });

  final double textFieldHeight;
  final double textFieldFontSize;
  final String hintText;
  final double hintFontSize;
  final bool isFocus;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: textFieldHeight,
      decoration: BoxDecoration(
        color: const Color(0xffc1bfbf).withValues(alpha: 0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Center(
        child: TextField(
          focusNode: focusNode,
          controller: controller,
          canRequestFocus: isFocus,
          onTap: onTap,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          style: TextStyle(
            color: Colors.white,
            fontSize: textFieldFontSize,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 0.3,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              child: const FittedBox(child: Icon(CupertinoIcons.search)),
            ),
            contentPadding: const EdgeInsets.only(left: 10),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.withValues(alpha: 0.7),
              fontSize: hintFontSize,
            ),
          ),
        ),
      ),
    );
  }
}
