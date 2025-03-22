import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/categories_item_container.dart';

class KhoPhimYearsWidget extends StatefulWidget {
  const KhoPhimYearsWidget({super.key, required this.onSelected, required this.years});

  final ValueChanged<String> onSelected;
  final List<String> years;

  @override
  State<KhoPhimYearsWidget> createState() => _KhoPhimYearsWidgetState();
}

class _KhoPhimYearsWidgetState extends State<KhoPhimYearsWidget> {
  late int selectedIndex;
  @override
  void initState() {
    selectedIndex = 0;
    widget.onSelected(widget.years[selectedIndex]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.years.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
              widget.onSelected(widget.years[selectedIndex]);
            });
          },
          child: CategoriesItemContainer(
            name: widget.years[index],
            backgroundColor: selectedIndex == index
                ? Colors.grey.withValues(alpha: 0.2)
                : Colors.transparent,
            textColor: selectedIndex == index
                ? Colors.green.withValues(alpha: 0.8)
                : Colors.white,
          ),
        ),
        separatorBuilder: (BuildContext context, int index) =>
            const ResponsiveSizedBox(width: 10),
      ),
    );
  }
}
