import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_supper_app_core/core.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/common/screens/loading_page.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/common/utils/enum/kho_phim/page_status.dart';

import 'bloc/categories/category_list_bloc.dart';
import 'bloc/countries/countries_bloc.dart';
import 'bloc/kho_phim/kho_phim_page_bloc.dart';
import 'bloc/kho_phim_filter/kho_phim_filter_bloc.dart';
import 'widget/kho_phim_categories_widget.dart';
import 'widget/kho_phim_countries_widget.dart';
import 'widget/kho_phim_infinite_gridview_widget.dart';
import 'widget/kho_phim_language_sub_widget.dart';
import 'widget/kho_phim_years_widget.dart';
import 'widget/title_and_search_icon.dart';

class KhoPhimPage extends StatefulWidget {
  const KhoPhimPage({super.key});

  @override
  State<KhoPhimPage> createState() => _KhoPhimPageState();
}

class _KhoPhimPageState extends State<KhoPhimPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<InfiniteGridViewMoviesState> _gridKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _bootstrapKhoPhimPage();
  }

  void _bootstrapKhoPhimPage() {
    context.read<CountriesBloc>().add(const GetAllCountry());
    context.read<CategoryListBloc>().add(const GetAllCategories());
    context.read<KhoPhimPageBloc>().add(const KhoPhimLoadAllBlocEvent());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (notification.depth != 0) return false;
    if (notification is ScrollEndNotification) {
      _gridKey.currentState?.handleScrollEnd(notification.metrics);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KhoPhimPageBloc, KhoPhimPageState>(
      buildWhen: (p, c) => p.status != c.status,
      builder: (context, state) {
        switch (state.status) {
          case KhoPhimPageStatus.init:
            return const SizedBox.shrink();
          case KhoPhimPageStatus.loading:
            return const LoadingPage();
          case KhoPhimPageStatus.error:
            return const ErrorPage();
          case KhoPhimPageStatus.success:
            return _KhoPhimSuccessBody(
              state: state,
              scrollController: _scrollController,
              gridKey: _gridKey,
              onScrollNotification: _onScrollNotification,
            );
        }
      },
    );
  }
}

class _KhoPhimSuccessBody extends StatefulWidget {
  const _KhoPhimSuccessBody({
    required this.state,
    required this.scrollController,
    required this.gridKey,
    required this.onScrollNotification,
  });

  final KhoPhimPageState state;
  final ScrollController scrollController;
  final GlobalKey<InfiniteGridViewMoviesState> gridKey;
  final bool Function(ScrollNotification) onScrollNotification;

  @override
  State<_KhoPhimSuccessBody> createState() => _KhoPhimSuccessBodyState();
}

class _KhoPhimSuccessBodyState extends State<_KhoPhimSuccessBody> {
  @override
  void initState() {
    super.initState();
    _onInitializeFilters();
  }

  void _onInitializeFilters() {
    context.read<KhoPhimFilterBloc>().add(
          KhoPhimFilterEvent.initialize(
            defaultCountrySlug: widget.state.countries[1].slug,
          ),
        );
  }

  bool _buildWhen(KhoPhimFilterState p, KhoPhimFilterState c) {
    return p.countrySlug != c.countrySlug ||
        p.categorySlug != c.categorySlug ||
        p.yearSlug != c.yearSlug ||
        p.languageSlug != c.languageSlug;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NotificationListener<ScrollNotification>(
        onNotification: widget.onScrollNotification,
        child: SingleChildScrollView(
          controller: widget.scrollController,
          child: Column(
            spacing: 20.v,
            children: [
              // Title and search icon
              const TitleAndSearchIcon(),

              // Countries filter
              KhoPhimCountries(countries: widget.state.countries),

              // Categories filter
              KhoPhimCategoriesWidget(categories: widget.state.categories),

              // Years filter
              KhoPhimYearsWidget(years: widget.state.years),

              // Language filter
              KhoPhimLanguageSubWidget(langs: widget.state.langs),

              // Movies gridview
              BlocBuilder<KhoPhimFilterBloc, KhoPhimFilterState>(
                buildWhen: _buildWhen,
                builder: (context, filters) {
                  if (filters.countrySlug.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return InfiniteGridViewMovies(
                    key: widget.gridKey,
                    categorySlug: filters.categorySlug,
                    countrySlug: filters.countrySlug,
                    yearSlug: filters.yearSlug,
                    languageSlug: filters.languageSlug,
                  );
                },
              ),
              const ResponsiveSizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
