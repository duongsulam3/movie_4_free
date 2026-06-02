import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/kho_phim_filter/kho_phim_filter_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/categories_item_container.dart';

class KhoPhimYearsWidget extends StatelessWidget {
  const KhoPhimYearsWidget({super.key, required this.years});

  final List<String> years;

  void _onYearSelected(BuildContext context, String year) {
    context
        .read<KhoPhimFilterBloc>()
        .add(KhoPhimFilterEvent.yearSelected(year));
  }

  Widget _onBuildSeperate(BuildContext cxt, int i) {
    return const ResponsiveSizedBox(width: 10);
  }

  Color _getBackgroundColor(bool selected) {
    return selected ? Colors.grey.withValues(alpha: 0.2) : Colors.transparent;
  }

  Color _getTextColor(bool selected) {
    return selected ? Colors.green.withValues(alpha: 0.8) : Colors.white;
  }

  String _getDisplayName(String year) {
    return year == '0' ? 'Tất cả các năm' : year;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KhoPhimFilterBloc, KhoPhimFilterState>(
      buildWhen: (p, c) => p.yearSlug != c.yearSlug,
      builder: (context, filterState) {
        return ResponsiveSizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final year = years[index];
              final selected = year == filterState.yearSlug;
              return GestureDetector(
                onTap: () => _onYearSelected(context, year),
                child: CategoriesItemContainer(
                  name: _getDisplayName(year),
                  backgroundColor: _getBackgroundColor(selected),
                  textColor: _getTextColor(selected),
                ),
              );
            },
            itemCount: years.length,
            separatorBuilder: _onBuildSeperate,
          ),
        );
      },
    );
  }
}
