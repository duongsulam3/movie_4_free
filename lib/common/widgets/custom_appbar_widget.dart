import 'package:flutter/material.dart';

class CustomAppbarWidget extends StatefulWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final Widget? leadingWidget;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final double titleFontSize;
  final bool isCenterTitle;
  final Color backgroundColor;
  final List<ScrollController> scrollControllers;
  final TabController tabController;
  final PreferredSizeWidget? appBarBottomWidget;
  const CustomAppbarWidget({
    super.key,
    required this.appBarHeight,
    required this.scrollControllers,
    required this.tabController,
    this.leadingWidget,
    this.titleWidget,
    this.titleFontSize = 30,
    this.isCenterTitle = false,
    this.backgroundColor = Colors.transparent,
    this.actions,
    this.appBarBottomWidget,
  });

  @override
  State<CustomAppbarWidget> createState() => _CustomAppbarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

class _CustomAppbarWidgetState extends State<CustomAppbarWidget> {
  late ScrollController currentScrollController;
  @override
  void initState() {
    super.initState();
    currentScrollController =
        widget.scrollControllers[widget.tabController.index];
    widget.tabController.addListener(_handleTabChange);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() {});
    });
  }

  void _handleTabChange() {
    setState(() {
      currentScrollController =
          widget.scrollControllers[widget.tabController.index];
    });
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_handleTabChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: currentScrollController,
      builder: (context, child) {
        if (currentScrollController.hasClients) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            color: currentScrollController.offset > 0
                ? widget.backgroundColor
                : Colors.transparent,
            child: AppBar(
              scrolledUnderElevation: 0,
              elevation: 0,
              leading: widget.leadingWidget,
              centerTitle: widget.isCenterTitle,
              actions: widget.actions,
              backgroundColor: Colors.transparent,
              title: widget.titleWidget,
              bottom: widget.appBarBottomWidget,
            ),
          );
        }
        return AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          leading: widget.leadingWidget,
          centerTitle: widget.isCenterTitle,
          actions: widget.actions,
          backgroundColor: Colors.transparent,
          title: widget.titleWidget,
          bottom: widget.appBarBottomWidget,
        );
      },
    );
  }
}
