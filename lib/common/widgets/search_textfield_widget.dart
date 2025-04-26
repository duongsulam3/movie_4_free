import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/search_suffix_icon.dart';

class SearchTextField extends StatefulWidget {
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
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: widget.textFieldHeight,
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
              focusNode: widget.focusNode,
              controller: widget.controller,
              canRequestFocus: widget.isFocus,
              onTap: widget.onTap,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              cursorHeight: widget.textFieldHeight / 2,
              style: TextStyle(
                color: Colors.white,
                fontSize: widget.fontSize,
              ),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                isDense: true, //! Add this to align center vertical
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.withValues(alpha: 0.7),
                  fontSize: widget.fontSize,
                ),
                suffixIcon: SearchSuffixIcon(controller: widget.controller),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
