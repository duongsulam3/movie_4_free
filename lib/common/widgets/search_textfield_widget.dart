import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    this.textFieldHeight = 30,
    this.hintText = "",
    this.isFocus = true,
    this.onTap,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
  });

  final double textFieldHeight;
  final String hintText;
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
  bool isNotEmpty = false;

  @override
  void initState() {
    updateIsNotEmpty();
    super.initState();
  }

  void updateIsNotEmpty() {
    if (widget.controller == null) return;
    widget.controller!.addListener(() {
      if (widget.controller!.text.isNotEmpty) {
        setState(() {
          isNotEmpty = true;
        });
      } else {
        setState(() {
          isNotEmpty = false;
        });
      }
    });
  }

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
      //TODO HANDLE TEXTFIELD ALIGN CENTER VERTICALLY
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
              style: const TextStyle(
                color: Colors.white,
                // fontSize: widget.textFieldHeight / 2,
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
                  child: FittedBox(
                    child: isNotEmpty
                        ? GestureDetector(
                            onTap: () => widget.controller!.clear(),
                            child: const Icon(CupertinoIcons.xmark_circle_fill),
                          )
                        : const Icon(CupertinoIcons.search),
                  ),
                ),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.withValues(alpha: 0.7),
                  // fontSize: widget.textFieldHeight / 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
