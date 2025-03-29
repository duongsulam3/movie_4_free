import 'dart:developer';

import 'package:flutter/material.dart';

class CustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final double appBarHeight;
  final Widget? leadingWidget;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final double titleFontSize;
  final bool isCenterTitle;
  final Color backgroundColor;
  final ScrollController scrollController;
  final PreferredSizeWidget? appBarBottomWidget;
  const CustomAppbarWidget({
    super.key,
    required this.appBarHeight,
    required this.scrollController,
    this.leadingWidget,
    this.titleWidget,
    this.titleFontSize = 30,
    this.isCenterTitle = false,
    this.backgroundColor = Colors.transparent,
    this.actions,
    this.appBarBottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (_, child) {
        if (scrollController.hasClients) {
          log("AppBar scroll offset: ${scrollController.offset}");
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            color: scrollController.offset > 0
                ? backgroundColor
                : Colors.transparent,
            child: AppBar(
              scrolledUnderElevation: 0,
              elevation: 0,
              leading: leadingWidget,
              centerTitle: isCenterTitle,
              actions: actions,
              backgroundColor: Colors.transparent,
              title: titleWidget,
              bottom: appBarBottomWidget,
            ),
          );
        }
        return AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          leading: leadingWidget,
          centerTitle: isCenterTitle,
          actions: actions,
          backgroundColor: Colors.transparent,
          title: titleWidget,
          bottom: appBarBottomWidget,
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
