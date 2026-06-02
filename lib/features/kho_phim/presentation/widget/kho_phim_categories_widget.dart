import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/entity/kho_phim_category_entity.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/kho_phim_filter/kho_phim_filter_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/categories_item_container.dart';

class KhoPhimCategoriesWidget extends StatelessWidget {
  const KhoPhimCategoriesWidget({
    super.key,
    required this.categories,
  });

  final List<KhoPhimCategoryEntity> categories;

  void _onCategorySelected(BuildContext context, String slug) {
    context
        .read<KhoPhimFilterBloc>()
        .add(KhoPhimFilterEvent.categorySelected(slug));
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KhoPhimFilterBloc, KhoPhimFilterState>(
      buildWhen: (p, c) => p.categorySlug != c.categorySlug,
      builder: (context, filterState) {
        return ResponsiveSizedBox(
          height: 40,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = categories[index];
              final selected = category.slug == filterState.categorySlug;
              return GestureDetector(
                onTap: () => _onCategorySelected(context, category.slug),
                child: CategoriesItemContainer(
                  name: category.name,
                  backgroundColor: _getBackgroundColor(selected),
                  textColor: _getTextColor(selected),
                ),
              );
            },
            itemCount: categories.length,
            separatorBuilder: _onBuildSeperate,
          ),
        );
      },
    );
  }
}
