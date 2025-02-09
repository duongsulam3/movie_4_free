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
  
  const CustomAppbarWidget({
    super.key,
    required this.appBarHeight,
    this.leadingWidget,
    this.titleWidget,
    this.titleFontSize = 30,
    this.isCenterTitle = false,
    this.backgroundColor = Colors.transparent,
    this.actions,
   
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      leading: leadingWidget,
      centerTitle: isCenterTitle,
      actions: actions,
      backgroundColor: backgroundColor,
      title: titleWidget,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
