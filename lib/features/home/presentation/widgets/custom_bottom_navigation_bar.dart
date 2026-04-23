import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.items,
    required this.currentIndex,
    this.onItemSelected,
  });

  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int>? onItemSelected;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  static const double _paintHeight = 60.0;
  static const double _barHeight = 100.0;
  static const double _itemHeight = 70.0;
  static const double _iconContainerSize = 25.0;

  late AnimationController _controller;
  late Animation<double> _animation;
  late double position;
  int _selectedIndex = 0;

  double horizontalPadding = 20.0;
  double horizontalMargin = 20.0;

  Animation<double> _buildPositionAnimation({
    required double begin,
    required double end,
  }) {
    return Tween<double>(
      begin: begin,
      end: end,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );
  }

  double _itemWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return (screenWidth - (2 * horizontalMargin) - (2 * horizontalPadding)) / 3;
  }

  EdgeInsets _itemPadding(bool isSelected) {
    return isSelected
        ? const EdgeInsets.only(top: 10.0)
        : const EdgeInsets.only(top: 18.0, bottom: 5.0);
  }

  Alignment _itemAlignment(bool isSelected) {
    return isSelected ? Alignment.center : Alignment.bottomCenter;
  }

  Offset _itemSlideOffset(bool isSelected) {
    return isSelected ? const Offset(0, -0.2) : Offset.zero;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 375,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    _animation = _buildPositionAnimation(
      begin: getEndpointPosition(widget.currentIndex),
      end: getEndpointPosition(widget.currentIndex),
    );

    _selectedIndex = widget.currentIndex;
    position = getEndpointPosition(widget.currentIndex);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CustomBottomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex == widget.currentIndex) return;
    _selectedIndex = widget.currentIndex;
    position = getEndpointPosition(widget.currentIndex);
    _animation = _buildPositionAnimation(
      begin: position,
      end: position,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double getEndpointPosition(int index) {
    // Calculate the X offset where the active circle should be centered.
    final screenWidth = MediaQuery.of(context).size.width;
    final totalMargin = 2 * horizontalMargin;
    final totalPadding = 2 * horizontalPadding;
    final availableWidth = screenWidth - totalPadding - totalMargin;
    final itemWidth = availableWidth / widget.items.length;
    final itemStartX = itemWidth * index;
    final itemCenterX = itemStartX + (itemWidth / 2);

    // 70 is the active circle radius-offset used by the current painter path.
    const activeCircleOffset = 70.0;
    return horizontalPadding + itemCenterX - activeCircleOffset;
  }

  void _onItemTap(int i) {
    if (i == _selectedIndex) return;
    setState(() {
      _handleAnimation(i);
      _selectedIndex = i;
    });
    widget.onItemSelected?.call(i);
  }

  void _handleAnimation(int index) {
    final targetPosition = getEndpointPosition(index);
    _animation = _buildPositionAnimation(
      begin: position,
      end: targetPosition,
    );

    _controller.forward(from: 0).then((_) {
      if (!mounted) return;
      position = targetPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _Painter(position: _animation.value),
          size: Size(
            MediaQuery.of(context).size.width - (2 * horizontalMargin),
            _paintHeight,
          ),
          child: SizedBox(
            height: _barHeight,
            width: MediaQuery.of(context).size.width - (2 * horizontalMargin),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                children: List.generate(widget.items.length, (i) {
                  final item = widget.items[i];
                  final isSelected = i == _selectedIndex;
                  return GestureDetector(
                    onTap: () => _onItemTap(i),
                    child: AnimatedContainer(
                      // color: Colors.red,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      height: _itemHeight,
                      width: _itemWidth(context),
                      padding: _itemPadding(isSelected),
                      alignment: _itemAlignment(isSelected),
                      child: SizedBox(
                        height: _iconContainerSize,
                        width: _iconContainerSize,
                        child: AnimatedSlide(
                          // Active icon moves upward while staying centered.
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOutCubic,
                          offset: _itemSlideOffset(isSelected),
                          child: Center(
                            child: item.icon,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Painter extends CustomPainter {
  final double position;
  const _Painter({required this.position});

  static const double _startY = 40.0;
  static const double _endY = 100.0;
  static const double _leftRadius = 20.0;
  static const double _activeCircleRadius = 30.0;
  static const double _activeCircleCenterY = 50.0;
  static const double _activeCircleXOffset = 70.0;

  static const Color _deepShadowColor = Color(0xCC000000);
  static const Color _glowColor = Color(0x33FFFFFF);

  Paint _fillPaint() {
    return Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
  }

  Paint _edgePaint() {
    return Paint()
      ..color = _glowColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
  }

  Path _buildBarPath(Size size) {
    final path = Path()..moveTo(_leftRadius, _startY);

    path.lineTo(position < _leftRadius ? _leftRadius : position, _startY);
    // Use cubic segments so the notch border keeps a smooth tangent.
    path.cubicTo(
      40.0 + position,
      _startY,
      30.0 + position,
      _startY + 24.0,
      52.0 + position,
      _startY + 42.0,
    );
    path.cubicTo(
      60.0 + position,
      _startY + 50.0,
      80.0 + position,
      _startY + 50.0,
      90.0 + position,
      _startY + 42.0,
    );
    path.cubicTo(
      110.0 + position,
      _startY + 24.0,
      100.0 + position,
      _startY,
      (128.0 + position) > (size.width - _leftRadius)
          ? size.width - _leftRadius
          : 140.0 + position,
      _startY,
    );
    path.lineTo(size.width - _leftRadius, _startY);

    // Box with Border Radius
    path.quadraticBezierTo(size.width, _startY, size.width, _startY + 25.0);
    path.lineTo(size.width, _endY - 25.0);
    path.quadraticBezierTo(size.width, _endY, size.width - 25.0, _endY);
    path.lineTo(25.0, _endY);
    path.quadraticBezierTo(0.0, _endY, 0.0, _endY - 25.0);
    path.lineTo(0.0, _startY + 25.0);
    path.quadraticBezierTo(0.0, _startY, _leftRadius, _startY);
    path.close();
    return path;
  }

  Offset _activeCircleCenter() {
    return const Offset(0, _activeCircleCenterY).translate(
      _activeCircleXOffset + position,
      0,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = _fillPaint();
    final barPath = _buildBarPath(size);
    final activeCircleCenter = _activeCircleCenter();
    final activeCirclePath = Path()
      ..addOval(
        Rect.fromCircle(
            center: activeCircleCenter, radius: _activeCircleRadius),
      );

    // Layered shadow + subtle edge glow to separate from dark background.
    canvas.drawShadow(barPath, _deepShadowColor, 18.0, true);
    canvas.drawShadow(barPath, _glowColor, 6.0, false);
    canvas.drawPath(barPath, fillPaint);
    canvas.drawPath(barPath, _edgePaint());

    canvas.drawShadow(activeCirclePath, _deepShadowColor, 14.0, true);
    canvas.drawShadow(activeCirclePath, _glowColor, 5.0, false);
    canvas.drawCircle(activeCircleCenter, _activeCircleRadius, fillPaint);
  }

  @override
  bool shouldRepaint(covariant _Painter oldDelegate) {
    return oldDelegate.position != position;
  }
}
