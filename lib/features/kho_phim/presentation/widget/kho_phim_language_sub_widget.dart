import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/kho_phim_filter/kho_phim_filter_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/categories_item_container.dart';

class KhoPhimLanguageSubWidget extends StatelessWidget {
  const KhoPhimLanguageSubWidget({super.key, required this.langs});

  final List<String> langs;

  void _onLanguageSelected(BuildContext context, String lang) {
    context
        .read<KhoPhimFilterBloc>()
        .add(KhoPhimFilterEvent.languageSelected(lang));
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

  String _getDisplayName(String lang) {
    return switch (lang) {
      'vietsub' => 'Vietsub',
      'thuyet-minh' => 'Thuyết Minh',
      _ => 'Lồng Tiếng',
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KhoPhimFilterBloc, KhoPhimFilterState>(
      buildWhen: (p, c) => p.languageSlug != c.languageSlug,
      builder: (context, filterState) {
        return ResponsiveSizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final lang = langs[index];
              final selected = lang == filterState.languageSlug;
              return GestureDetector(
                onTap: () => _onLanguageSelected(context, lang),
                child: CategoriesItemContainer(
                  name: _getDisplayName(lang),
                  backgroundColor: _getBackgroundColor(selected),
                  textColor: _getTextColor(selected),
                ),
              );
            },
            itemCount: langs.length,
            separatorBuilder: _onBuildSeperate,
          ),
        );
      },
    );
  }
}
