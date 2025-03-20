import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/categories_item_container.dart';
import 'package:smoth_movie_app/helper/helper.dart';

class KhoPhimYearsWidget extends StatefulWidget {
  const KhoPhimYearsWidget({super.key, required this.onSelected});

  final ValueChanged<String> onSelected;

  @override
  State<KhoPhimYearsWidget> createState() => _KhoPhimYearsWidgetState();
}

class _KhoPhimYearsWidgetState extends State<KhoPhimYearsWidget> {
  late List<String> listOfYear = const <String>[];
  late int selectedIndex;
  @override
  void initState() {
    listOfYear = Helper.getYears();
    listOfYear.insert(0, "Tất cả các năm");
    selectedIndex = 0;
    widget.onSelected(listOfYear[selectedIndex].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: listOfYear.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
              widget.onSelected(listOfYear[selectedIndex].toString());
            });
          },
          child: CategoriesItemContainer(
            name: listOfYear[index].toString(),
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
