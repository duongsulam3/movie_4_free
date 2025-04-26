import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/search_suffix_icon.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.textFieldHeight = 30,
    this.hintText = "",
    this.isFocus = true,
    this.fontSize = 13,
    this.onTap,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
  });

  final double textFieldHeight;
  final String hintText;
  final double fontSize;
  final bool isFocus;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: textFieldHeight,
      decoration: BoxDecoration(
        color: const Color(0xffc1bfbf).withValues(alpha: 0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: focusNode,
              controller: controller,
              canRequestFocus: isFocus,
              onTap: onTap,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              cursorHeight: textFieldHeight / 2,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
              ),
              decoration: InputDecoration(
                isDense: true, //! Add this to align center vertical
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.withValues(alpha: 0.7),
                  fontSize: fontSize,
                ),
                suffixIcon: SearchSuffixIcon(controller: controller),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
