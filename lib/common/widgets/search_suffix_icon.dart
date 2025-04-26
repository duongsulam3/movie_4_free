import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchSuffixIcon extends StatefulWidget {
  const SearchSuffixIcon({super.key, this.controller});

  final TextEditingController? controller;

  @override
  State<SearchSuffixIcon> createState() => _SearchSuffixIconState();
}

class _SearchSuffixIconState extends State<SearchSuffixIcon> {
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
        child: widget.controller == null
            ? const Icon(CupertinoIcons.search)
            : isNotEmpty
                ? GestureDetector(
                    onTap: () => widget.controller!.clear(),
                    child: const Icon(CupertinoIcons.xmark_circle_fill),
                  )
                : const Icon(CupertinoIcons.search),
      ),
    );
  }
}
