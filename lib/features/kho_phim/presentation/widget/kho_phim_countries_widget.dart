import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/entity/kho_phim_country_entity.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/kho_phim_filter/kho_phim_filter_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/categories_item_container.dart';

class KhoPhimCountries extends StatelessWidget {
  const KhoPhimCountries({super.key, required this.countries});

  final List<KhoPhimCountryEntity> countries;

  void _onCountrySelected(BuildContext context, String slug) {
    context
        .read<KhoPhimFilterBloc>()
        .add(KhoPhimFilterEvent.countrySelected(slug));
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
      buildWhen: (p, c) => p.countrySlug != c.countrySlug,
      builder: (context, filterState) {
        return ResponsiveSizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final country = countries[index];
              final selected = country.slug == filterState.countrySlug;
              return GestureDetector(
                onTap: () => _onCountrySelected(context, countries[index].slug),
                child: CategoriesItemContainer(
                  name: countries[index].name,
                  backgroundColor: _getBackgroundColor(selected),
                  textColor: _getTextColor(selected),
                ),
              );
            },
            itemCount: countries.length,
            separatorBuilder: _onBuildSeperate,
          ),
        );
      },
    );
  }
}
