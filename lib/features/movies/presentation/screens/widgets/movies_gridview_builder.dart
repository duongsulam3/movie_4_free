import 'package:flutter_supper_app_core/core.dart';

class MoviesGridBuilder extends StatelessWidget {
  const MoviesGridBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.primary = true,
  });

  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      primary: primary,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.h,
        mainAxisExtent: 220.v,
      ),
    );
  }
}
