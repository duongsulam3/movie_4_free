import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/progress_indicator.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/core/bloc/countries_state_status.dart';
import 'package:smoth_movie_app/core/error/error_page.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/countries/countries_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/categories_item_container.dart';

class KhoPhimCountries extends StatefulWidget {
  const KhoPhimCountries({super.key, required this.onSelected});

  final ValueChanged<String> onSelected;

  @override
  State<KhoPhimCountries> createState() => _KhoPhimCountriesState();
}

class _KhoPhimCountriesState extends State<KhoPhimCountries> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountriesBloc, CountriesState>(
      //** Listen when success return the first category slug */
      listenWhen: (previous, current) =>
          current.status == CountriesStateStatus.success,
      listener: (context, state) {
        if (state.status == CountriesStateStatus.success) {
          widget.onSelected(state.countries[selectedIndex].slug);
        }
      },
      //** Listen when success return the first category slug */
      builder: (context, state) {
        switch (state.status) {
          case CountriesStateStatus.init:
            return const SizedBox.shrink();
          case CountriesStateStatus.loading:
            return const Center(child: ProgressIndicatorCustom());
          case CountriesStateStatus.error:
            return const ErrorPage();
          default:
            return ResponsiveSizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      widget.onSelected(state.countries[index].slug);
                    });
                  },
                  child: CategoriesItemContainer(
                    name: state.countries[index].name,
                    backgroundColor: selectedIndex == index
                        ? Colors.grey.withValues(alpha: 0.2)
                        : Colors.transparent,
                    textColor: selectedIndex == index
                        ? Colors.green.withValues(alpha: 0.8)
                        : Colors.white,
                  ),
                ),
                itemCount: state.countries.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const ResponsiveSizedBox(width: 10),
              ),
            );
        }
      },
    );
  }
}
