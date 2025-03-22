import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/entity/kho_phim_category_entity.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/categories_item_container.dart';

class KhoPhimCategoriesWidget extends StatefulWidget {
  const KhoPhimCategoriesWidget({
    super.key,
    required this.onSelected,
    required this.categories,
  });

  final ValueChanged<String> onSelected;
  final List<KhoPhimCategoryEntity> categories;

  @override
  State<KhoPhimCategoriesWidget> createState() =>
      _KhoPhimCategoriesWidgetState();
}

class _KhoPhimCategoriesWidgetState extends State<KhoPhimCategoriesWidget> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizedBox(
      height: 40,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
              widget.onSelected(widget.categories[index].slug);
            });
          },
          child: CategoriesItemContainer(
            name: widget.categories[index].name,
            backgroundColor: selectedIndex == index
                ? Colors.grey.withValues(alpha: 0.2)
                : Colors.transparent,
            textColor: selectedIndex == index
                ? Colors.green.withValues(alpha: 0.8)
                : Colors.white,
          ),
        ),
        itemCount: widget.categories.length,
        separatorBuilder: (BuildContext context, int index) =>
            const ResponsiveSizedBox(width: 10),
      ),
    );
  }
}
