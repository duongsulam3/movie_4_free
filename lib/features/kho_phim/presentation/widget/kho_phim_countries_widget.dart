import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/entity/kho_phim_country_entity.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/categories_item_container.dart';

class KhoPhimCountries extends StatefulWidget {
  const KhoPhimCountries({super.key, required this.onSelected, required this.countries});

  final ValueChanged<String> onSelected;
  final List<KhoPhimCountryEntity> countries;

  @override
  State<KhoPhimCountries> createState() => _KhoPhimCountriesState();
}

class _KhoPhimCountriesState extends State<KhoPhimCountries> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = 1;
    widget.onSelected(widget.countries[selectedIndex].slug);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
              widget.onSelected(widget.countries[selectedIndex].slug);
            });
          },
          child: CategoriesItemContainer(
            name: widget.countries[index].name,
            backgroundColor: selectedIndex == index
                ? Colors.grey.withValues(alpha: 0.2)
                : Colors.transparent,
            textColor: selectedIndex == index
                ? Colors.green.withValues(alpha: 0.8)
                : Colors.white,
          ),
        ),
        itemCount: widget.countries.length,
        separatorBuilder: (BuildContext context, int index) =>
            const ResponsiveSizedBox(width: 10),
      ),
    );
  }
}
