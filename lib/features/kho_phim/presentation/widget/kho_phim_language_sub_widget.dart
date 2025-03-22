import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/categories_item_container.dart';

class KhoPhimLanguageSubWidget extends StatefulWidget {
  const KhoPhimLanguageSubWidget({super.key, required this.onSelected, required this.langs});

  final ValueChanged<String> onSelected;
  final List<String> langs;

  @override
  State<KhoPhimLanguageSubWidget> createState() =>
      _KhoPhimLanguageSubWidgetState();
}

class _KhoPhimLanguageSubWidgetState extends State<KhoPhimLanguageSubWidget> {
  late int selectedIndex;
  @override
  void initState() {
    selectedIndex = 1;
    widget.onSelected(widget.langs[selectedIndex].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.langs.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
              widget.onSelected(widget.langs[selectedIndex].toString());
            });
          },
          child: CategoriesItemContainer(
            name: widget.langs[index] == "vietsub"
                ? "Vietsub"
                : widget.langs[index] == "thuyet-minh"
                    ? "Thuyết Minh"
                    : "Lồng Tiếng",
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
